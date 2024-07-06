#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include <pthread.h>
#include <dlt/dlt.h>

DLT_DECLARE_CONTEXT(ctx);

void* thread_func(void *arg) {
    //pthread_detach(pthread_self());
    while(1) {
        printf("In thread_func: Thread alive!\n");
        DLT_LOG(ctx, DLT_LOG_INFO, DLT_CSTRING("Thread alive!"));
        sleep(1);
    }
}

int main() {
    pthread_t thread;
    DLT_REGISTER_APP("HELO", "Test App for hello dlt");
    DLT_REGISTER_CONTEXT(ctx, "CTX1", "Context no 1 for hello");
    pthread_create(&thread, NULL, thread_func, NULL);
    printf("In main thread\n");
    sleep(3);
    /*..*/
    printf("Calling exit()\n");
    exit(EXIT_SUCCESS);
    /*..*/
    DLT_UNREGISTER_CONTEXT(ctx);
    DLT_UNREGISTER_APP();
}
