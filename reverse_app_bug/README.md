# Fixing a bug from real scenario
We sometimes easily confuse between the two concepts signaling and locking,
corresponding to semaphore and mutex. This doc will not explain these
two concepts in detail, and of course we are talking about POSIX semaphore
and POSIX thread.

## DLT-Daemon
It is an userspace application for tracing logs on Automotive IVI

## Scenario
There is a coredump generated on target, the coredump cannot be shared
due to company's data security policies.
So, a summary here would help:
+ Two applications using DLT APIs as backend
+ One calling exit() in a thread
+ The other one trying to log with DLT API "DLT_LOG()"
+ The coredump is generated, DLT Daemon crashes

The system maintained by DLT team includes a shared lib: libdlt.so.
This lib includes a ring buffer to store user data structures from users.
This buffer will be neatly locked so that at a time only one user can access
this critical area.

## Reverse engineering process
After 4 days of testing the system and going through 1000 tests per day
including all types of some tests, a bug emerged: SIGSEGV

### Step 1: RCA - Root cause analyzing

Analyzing the problem is an important step before going to the next steps.
We see that Segmentation Fault has many causes:
+ Dereferencing a NULL pointer
+ Accessing unititialized pointer
+ Buffer Overflow
+ Invalid Memory Access
+ etc

Initially, team was tricked when the user side's Buffer pointer accessed
an unknown memory area (Invalid Memory Access). However, the root cause
lies in the fact that this memory area is located right inside the
allocated partition, and this area is in the process of being freed.
Turning the problem around, team built a simple user model to simulate.
It turns out that there are 2 users running in parallel,
and 1 of them calls exit(), while the handler function in the lib has
registered atexit(), meaning whenever exit() is called,
this function will be called. See more at:
https://man7.org/linux/man-pages/man3/exit.3.html

### Step 2: Proceeding with reproduction

The dilemma arises because bugs of this type rarely occur under
certain conditions, when the gears mesh slightly misaligned and boom!
Core dumped. First, look at the core that the customer sent to sniff
and proceed to localize the area with a high chance of a race occurring.
After that, team delayed the threads to consider their collision,
and the results can be reproduced were as follows:
```
#0  0x00007ffff7f9af92 in dlt_buffer_push3 (buf=buf@entry=0x7ffff7fae3b0
<dlt_user+144>, data1=data1@entry=0x7ffff7567d18 "DUH\001\001",
size1=size1@entry=8, data2=data2@entry=0x7ffff7567d40 "=\003",
size2=size2@entry=26, data3=data3@entry=0x7ffff0000f70 "", size3=20)
at /home/lum3hc/work/ctf/dlt-daemon_folk_demo/src/shared/dlt_common.c:2765
2765	    write = ((int *)(buf->shm))[0];
```
At the time thread 2 is accessing the buffer and waiting (sleep),
another thread is trying to log into this buffer, leading to the SIGSEGV
(Segmentation fault) error. During this process, the sem_t variable is
actually locking, and the faulty location is dereferencing a
NULL pointer (shm = 0x0):
```
>>> p dlt_mutex
$1 = {
  __size = '\000' <repeats 31 times>,
  __align = 0
}
>>> p dlt_user.startup_buffer
$2 = {
  shm = 0x0,
  size = 49988,
  mem = 0x0,
  min_size = 50000,
  max_size = 500000,
  step_size = 50000
}
```
### Step 3: Asking questions

+ Is this critical area really locked?
+ What is the locking mechanism it is using?

With those doubts, team looked back at the code base and discovered that
this critical area is using a semaphore. However, this semaphore is used as
a count semaphore even though the comment says binary semaphore, and this line
of code has existed for 13 years (since the beginning of this SW development).
OK what's next?

There are a couple of issues here, first the semaphore, or even the binary semaphore,
is used as a signaling mechanism, while the mutex is a special type of binary semaphore
that is used as a signaling mechanism. locking mechanism. Simply imagine you are using a
self-study room and occupy the whole room. When you leave the room and the next person
receives information, they can use the room, that is binary semaphore - signaling.
However, you leave the room, lock it and keep the key, so no one can use it unless you open it,
this is mutex - locking. Apparently, due to some implementation errors, the lib's semaphore,
in addition to receiving the value 0/1, also receives values ​​greater than 1 in some race conditions.
This is the reason why the critical area can be accessed very easily when you hang threads.

### Step 4: Fixing the bugs

It's wrong from the beginning to not use the locking mechanism, so team just need to replace
the semaphore with a mutex, and lock exactly where it needs to be locked.

You can refer to the fix at: https://github.com/COVESA/dlt-daemon/pull/588