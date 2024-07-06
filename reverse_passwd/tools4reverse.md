## TOOLS for REVERSING

### LEVEL 1
Hexdump here, but not much info!
```
$ xxd reader | less
00000000: 7f45 4c46 0201 0100 0000 0000 0000 0000  .ELF............
00000010: 0300 3e00 0100 0000 e010 0000 0000 0000  ..>.............
00000020: 4000 0000 0000 0000 9045 0000 0000 0000  @........E......
00000030: 0000 0000 4000 3800 0d00 4000 2400 2300  ....@.8...@.$.#.
00000040: 0600 0000 0400 0000 4000 0000 0000 0000  ........@.......
00000050: 4000 0000 0000 0000 4000 0000 0000 0000  @.......@.......
00000060: d802 0000 0000 0000 d802 0000 0000 0000  ................
00000070: 0800 0000 0000 0000 0300 0000 0400 0000  ................
```

### LEVEL 2
All strings inside the binary is available, but not the hidden!
```
$ strings reader | less
/lib64/ld-linux-x86-64.so.2
libc.so.6
__isoc99_scanf
puts
__stack_chk_fail
printf
__cxa_finalize
strcmp
__libc_start_main
GLIBC_2.7
GLIBC_2.4
GLIBC_2.2.5
_ITM_deregisterTMCloneTable
__gmon_start__
_ITM_registerTMCloneTable
u+UH
revef
[]A\A]A^A_
Try to guess me!
Attemp: %d, type your guess:
Correct!
```

### LEVEL3
Object dumping in Intel format, good but still hard to read!
```
$ objdump -d -Mintel reader | less
Disassembly of section .text:

00000000000010e0 <_start>:
    10e0:       f3 0f 1e fa             endbr64
    10e4:       31 ed                   xor    ebp,ebp
    10e6:       49 89 d1                mov    r9,rdx
    10e9:       5e                      pop    rsi
    10ea:       48 89 e2                mov    rdx,rsp
    10ed:       48 83 e4 f0             and    rsp,0xfffffffffffffff0
    10f1:       50                      push   rax
    10f2:       54                      push   rsp
    10f3:       4c 8d 05 76 02 00 00    lea    r8,[rip+0x276]        # 1370 <__libc_csu_fini>
    10fa:       48 8d 0d ff 01 00 00    lea    rcx,[rip+0x1ff]        # 1300 <__libc_csu_init>
```

### ULTIMATE LEVEL
Recommend to use, the IDA!
```
$ ida
```
Install:
```
$ sudo dpkg --add-architecture i386

$ sudo apt-get update

$ sudo apt-get install libc6-i686:i386 libexpat1:i386 libffi6:i386 libfontconfig1:i386 libfreetype6:i386 libgcc1:i386 libglib2.0-0:i386 libice6:i386 libpcre3:i386 libpng12-0:i386 libsm6:i386 libstdc++6:i386 libuuid1:i386 libx11-6:i386 libxau6:i386 libxcb1:i386 libxdmcp6:i386 libxext6:i386 libxrender1:i386 zlib1g:i386 libx11-xcb1:i386 libdbus-1-3:i386 libxi6:i386 libsm6:i386 libcurl3:i386
```
In addition, it is also necessary to install the following packages, for IDA to present a usable & well-integrated GUI on many Debian & Ubuntu desktops. If the set of dependencies above are not enough to obtain a slick UI, please install the following:
```
$ sudo apt-get install libgtk2.0-0:i386 gtk2-engines-murrine:i386 gtk2-engines-pixbuf:i386 libpango1.0-0:i386
```
