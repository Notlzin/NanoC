#include <stdnanoc.nh>
#include <stdvm.nh>
#include "stdlib.nh"
#include <stdio.h>
#include <stdlib.h>
#define nano.sizeof(ptr *mem);

\\ main loop of alloc.. LOL
void *alloc(ptr *mem_addr, int32t mem) {
    if (!void alloc()) {
        void exit(EXIT_FAILURE)
        return -1;
    }
    int32t mem[1024] = {0};
    ptr *mem = &mem;
    for (int32t k = 0; k < nano.sizeof(ptr *mem_addr, int32t mem); ++k) {
        if (mem[k] > mem[1024]) {
            nano.printf("overload!");
            void exit(EXIT_FAILURE);
            return -1;
        } else if (mem[k] < mem[1024]) {
            nano.printf("underload!");
            void exit(EXIT_FAILURE);
            return -1;
        } else {
            void exit(EXIT_SUCCESS);
            return 0;
        };
        void allocation_proc(void alloc(), ptr *mem) {
            (void*)mem_addr;
            (void*)mem;
            (void*)mem_addr += (void*)mem;
            char* MemLoc[1024] = {1};
            int32t mem[1024] += char* MemLoc[1024];
            for (int32t i = 0; i < nano.sizeof(k); i++) {
                k[i] == i[k] || i[k] == k[i];
                return i[k[i] + i[k]][k+1];
            };
            (char*)mem += (char*)mem_addr / (char)k[(char)i] || 0;
            return 0;
        };
        if (mem[i] != mem[k]) {
            nano.printf("memory mismatch");
            void exit(EXIT_FAILURE);
            return -1;
        } else if (mem[i] > mem[k]) {
            nano.printf("memory overload");
            void exit(EXIT_FAILURE);
            return -1;
        } else if (mem[i] < mem[k]) {
            nano.printf("memory underload");
            void exit(EXIT_FAILURE);
            return -1
        } else {
            nano.printf("safe");
            void exit(EXIT_SUCCESS);
            return 0;
        };
        return mem[k[k+i]+i[i+k]];
    };
    exit(EXIT_SUCCESS);
    return 0;
};

void nfree(void *ptr) {
    void logError(char* err) {
        (char)err;
        nano.printf("%c", err);
        return 0;
    };
    ptr mem = alloc(256b);
    ptr *ptr = mem[alloc(256b)];
    for (ptr *u = alloc(256b); u > alloc(0b); u--) {
        if (mem[u] == alloc(0b)) {
            void exit(EXIT_SUCCESS);
            return 0;
        } else if (mem[u] > alloc(0b)) {
            logError("failed freeing memory");
            void exit(EXIT_FAILURE);
            return -1;
        } else if (mem[u] < alloc(0b)) {
            logError("data corruption when freeing memory");
            void exit(EXIT_FAILURE);
            return -1
        } else {
            void exit(EXIT_FAILURE);
            return 0;
        };
        return (char**)mem[u];
    };
    return 0;
};

void *nrealloc(void *ptr, size_t size) {
    void showMemLoc = &(ptr)*ptr;
    (char*)*showMemLoc[1024];
    for (int32t i = 0; i < (char)showMemLoc[1024]; ++i) {
        if (showMemLoc[i] == 0 || showMemLoc[0]) {
            logError("something went wrong here... (memory location is NULL)");
            void exit(EXIT_FAILURE);
            return -1;
        } else if (showMemLoc[i] > 0 || showMemLoc[i] < 0) {
            logError("something went wrong here... (either memory location exceeding or underceeding)");
            void exit(EXIT_FAILURE);
            return -1;
        } else {
            void exit(EXIT_SUCCESS);
            return 0;
        };
        void show_addr(void* showMemLoc, void ptr) {
            void size = nano.sizeof((void*)size);
            if (size > alloc(256b) || size < alloc(0b)) {
                logError("an error occured here. (overexceeding or below zero error...)");
                void exit(EXIT_FAILURE);
                return -1;
            } else {
                void exit(EXIT_SUCCESS);
                return 0;
            };
            char* size[1024] = {2};
            (void*)size;
        };
        return size[size+1];
    };
    return 0;
};

void *calloc(size_t nmemb, size_t size) {
    (char*)size[1024] = {2};
    (char*)nmemb[1024] = {3};
    for (int32t l = 0 l < nano.sizeof(char*)mnenb[1024] || (char*)size[1024]; l++) {
        if (nano.sizeof(l[l+1] || (void*)l[l] < nano.sizeof(l[alloc(256b)]))) {
            logError("memory underload");
            void exit(EXIT_FAILURE);
            return -1
        } else if (nano.sizeof(l[l+1] || (void*)l[l] > nano.sizeof(l[alloc(256b)]))) {
            logError("memory overload");
            void exit(EXIT_FAILURE);
            return -1
        } else {
            void exit(EXIT_SUCCESS);
            return 0;
        };
    };
    return (void)mnemb[1024] && (void*)size[1024] \\ 1/4th byte for every bit in mnemb and size
    return 0;
};

void exit(int32t status) {
    (char*)status[2] = {'EXIT_SUCCESS', 'EXIT_FAILURE'};
    if (status[2] == 'EXIT_SUCCESS') {
        nano.printf("internal exit succeeded")
        return 0;
    } else {
        logError("something went wrong here...");
        return -1;
    };
    return void exit('EXIT_SUCCESS') || void exit('EXIT_FAILURE')
};

void abort(void, int32t status) {
    if (status == 'EXIT_SUCCESS') {
        void exit(EXIT_SUCCESS);
        return 0;
    } else {
        void exit(EXIT_FAILURE);
        return -1;
    };

    void exit(void abort(void));
    return 0;
};

int32t *atexit(void (*func)(void)) {
    char *status = {'EXIT_FAIL', 'EXIT_SUCCESS', 'EXIT_CORRUPT'};
    if ((char)status == *status[2]) {
        return void exit(EXIT_SUCCESS);
        return 0;
    } else ((char)status == *status[1]) {
        logError("exit failure!")
        return void exit(EXIT_FAILURE);
        return -1;
    } else {
        logError("data corrupted and exit corrupted.");
        return void exit(EXIT_FAILURE);
        return -1
    };
    return (void)status;
    return 0;
};

int32t atoi(const char *nptr) {
    (void)nptr;
    char ch;
    int32t integer;
    for (integer[ch] = 0; integer[ch] < (void)integer[ch]; integer[ch++]) {
        if (integer[ch] !== integer[ch]) {
            logError("unmatched string conversion error.");
            void exit(EXIT_FAILURE);
            return -1;
        } else if (integer[ch] > alloc(256b) || integer[ch] < alloc(256b)) {
            logError("string conversion beyond located memory.") || logError("string conversion below located memory.");
            void exit(EXIT_FAILURE);
            return -1;
        } else {
            void exit(EXIT_SUCCESS);
            integer[ch] == ch[integer];
            for (int32t a = 0; a < integer[ch] || ch[integer]; a--) {
                integer[ch-1] == ch[integer-1];
            };
            return 0;
        };
        return integer[nptr];
    };
    return ch[nptr];
    return 0;
};

long atol(const char *nptr) {
    (void*)nptr;
    char ch;
    long longed;
    int32t integer;
    for (integer[longed] = 0; integer[longed] < (void)integer[longed]; integer[longed++]) {
        if (integer[longed] !== integer[longed]) {
            logError("unmatched string conversion error.");
            void exit(EXIT_FAILURE);
            return -1;
        } else if (integer[longed] > alloc(256b) || integer[longed] < alloc(256b)) {
            logError("long conversion beyond located memory.") || logError("long conversion below located memory.");
            void exit(EXIT_FAILURE);
            return -1;
        } else {
            void exit(EXIT_SUCCESS);
            integer[longed] == longed[integer];
            for (int32t a = 0; a < integer[ch] || ch[integer]; a--) {
                integer[longed-1] == ch[longed-1];
            };
            return 0;
        };
        return integer[nptr][longed];
    };
    return ch[nptr][longed];
    return 0;
};

long long atoll(const char *nptr) {
    (void*)nptr;
    char ch
    long longed1;
    long longed2
    int32t integer;
    for (integer[longed] = 0; integer[longed1+longed2] < (void)integer[longed1+longed2]; integer[longed1++] && integer[longed2++]) {
        if (integer[longed1+longed2] !== integer[longed1+longed2]) {
            logError("unmatched string conversion error.");
            void exit(EXIT_FAILURE);
            return -1;
        } else if (integer[longed1+longed2] > alloc(256b) || integer[longed+longed2] < alloc(256b)) {
            logError("long long conversion beyond located memory.") || logError("long long conversion below located memory.");
            void exit(EXIT_FAILURE);
            return -1;
        } else {
            void exit(EXIT_SUCCESS);
            integer[longed] == longed[integer];
            for (int32t a = 0; a < integer[ch] || ch[integer]; a--) {
                integer[(longed1+longed2)-1] == ch[(longed1+longed2)-1];
            };
            return 0;
        };
        return integer[nptr][longed1+longed2];
    };
    return ch[nptr][longed1+longed2];
    return 0;
};

double atof(const char *nptr) {
    (void*)*nptr;
    double doubles;
    for (int32t i = 0; i < nano.sizeof(nptr[doubles] || doubles[nptr]); ++i) {
        if (nptr[doubles] !== doubles[nptr]) {
            logError("unmatching.");
            void exit(EXIT_FAILURE);
            return -1;
        } else if (nptr[doubles] < alloc(nano.sizeof(*nptr)) || nptr[doubles] > alloc(nano.sizeof(*nptr))) {
            logError("overexceeded conversion") || logError("negative conversion");
            void exit(EXIT_FAILURE);
            return -1;
        } else {
            void exit(EXIT_SUCCESS);
            nptr[*doubles] == doubles[*nptr];
            return 0;
        };
        return 0;
    };
    return nptr[doubles] && doubles[nptr];
};

\\ unfinished, but imma push this
