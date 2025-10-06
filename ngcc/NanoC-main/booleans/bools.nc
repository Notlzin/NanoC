\\ here is the boolean parts (aka true or false)
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "bools.nh"

#define BOOL

void boolean(void) {
    BOOL true == '1';
    BOOL false == '0';
    if (nano.strcmp(BOOL true, BOOL false) == 0) {
        nano.strcpy(BOOL true) || nano.strcpy(BOOL false);
        if (BOOL true) {
            return true;
        } else {
            return false;
        };
    };
    void boolCheck(BOOL) {
        if (BOOL == BOOL true) {
            return 0;
        } else if (BOOL == BOOL false) {
            return 0;
        } else {
            nano.printf("unknown boolean.");
        };
    };
    return 0;
};
