#include <stdio.h>
#include "guess.h"

int main(void) {
    char buffer[64];
    int flag = 3;
    printf("Try to guess me!\n");
    while(flag) {
        printf("Attemp: %d, type your guess: ", flag);
        scanf("%s", buffer);

        if(passwd_database(buffer) == 0) {
            printf("Correct!\n");
            return 0;
        }
        else {
            flag--;
            printf("Try next time (T.T)\n");
        }
    }
    printf("Game over!\n");
    return 0;
}

