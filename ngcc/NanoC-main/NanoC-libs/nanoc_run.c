// nanoc_run.c aka the nanoc runtime
#include <stdio.h>
#include <string.h>
#include "stdlib_stub.h"

int main(void) {
    __nanoc_init();
    printfStub("hello from NanoC runtime program!!!");
    putsStub("this is a simulated NanoC program in runtime.");
    char *ptr = malloc_stub(16);
    if (ptr) {
        strcpy(ptr, "NanoC >> real C");
        printfStub(ptr);
    }
    atoi_stub("42");
    getenv_stub("PATH");
    free_stub(ptr);
    __nanoc_shutdown();
    return 0;
}
