// stdlib_stub.c

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int printfStub(const char* text) {
    printf("[NanoC::printf] %s\n", text);
    return 0;
}

int putsStub(const char* text) {
    printf("[NanoC::puts] %s\n", text);
    return 0;
}

void* malloc_stub(size_t size) {
    printf("[NanoC::malloc] allocating %zu bytes\n", size);
    void* ptr = malloc(size);
    return ptr;
}

void free_stub(void* ptr) {
    printf("[NanoC::free] freeing pointer %p\n", ptr);
    free(ptr);
}

void exit_stub(int code) {
    printf("[NanoC::exit] program terminated with code %d\n", code);
    exit(code);
}

int atoi_stub(const char* s) {
    printf("[NanoC::atoi] converting string '%s' -> int\n", s);
    return atoi(s);
}

char* getenv_stub(const char* name) {
    printf("[NanoC::getenv] requested '%s'\n", name);
    return getenv(name);
}

void __nanoc_init(void) {
    printf("[NanoC::init] runtime environment ready.\n");
}

void __nanoc_shutdown(void) {
    printf("[NanoC::shutdown] cleanup complete.\n");
}
