#include <string.h>
#include "guess.h"

int passwd_database(char *pass) {
    int ret = -1;
    const char password[] = {'r','e','v','e','r','s','e'};
    if(strcmp(pass, password) == 0) {
        ret = 0;
    }
    return ret;
}

