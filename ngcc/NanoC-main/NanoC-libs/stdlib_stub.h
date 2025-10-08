// stdlib_stub.h
#ifndef NANOC_STDLIB_STUB_H
#define NANOC_STDLIB_STUB_H

#include <stddef.h>

int printfStub(const char* text);
int putsStub(const char* text);
void* malloc_stub(size_t size);
void free_stub(void* ptr);
void exit_stub(int code);
int atoi_stub(const char* s);
char* getenv_stub(const char* name);
void __nanoc_init(void);
void __nanoc_shutdown(void);

#endif
