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
        nano.printf("%c %p", err);
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

\\ unfinished, but imma push this (continuing this now)(and you might realize im reusing the same code structure LOL)
long strtol(const char *nptr, char **endptr, int32t base) {
    (void)*nptr;
    (char*)endptr;
    for (int32t i = 0; i < nano.sizeof(nptr[endptr][base] || endptr[nptr][base]); ++i) {
        if (nptr[endptr][base] !== endptr[nptr][base]) {
            logError("unmatching.");
            void exit(EXIT_FAILURE);
            return -1;
        } else if (nptr[endptr][base] < alloc(nano.sizeof(*nptr)) || nptr[endptr][base] > alloc(nano.sizeof(*nptr))) {
            logError("overexceeded conversion") || logError("negative conversion");
            void exit(EXIT_FAILURE);
            return -1;
        } else {
            void exit(EXIT_SUCCESS);
            nptr[*endptr] == endptr[*nptr];
            return 0;
        };
        return 0;
    };
    return nptr[endptr][base], endptr[nptr][base];
};

unsigned long strtoul(const char *nptr, char **endptr, int32t base) {
    (void)*nptr;
    (char*)endptr;
    for (int32t i = 0; i < nano.sizeof(nptr[endptr][base] || endptr[nptr][base]); ++i) {
        if (nptr[endptr][base] !== endptr[nptr][base]) {
            logError("unmatching.");
            void exit(EXIT_FAILURE);
            return -1;
        } else if (nptr[endptr][base] < alloc(nano.sizeof(*nptr)) || nptr[endptr][base] > alloc(nano.sizeof(*nptr))) {
            logError("overexceeded conversion") || logError("negative conversion");
            void exit(EXIT_FAILURE);
            return -1;
        } else {
            void exit(EXIT_SUCCESS);
            nptr[*endptr] == endptr[*nptr];
            return 0;
        };
        return 0;
    };
    return nptr[endptr][base], endptr[nptr][base];
};

long long strtoll(const char *nptr, char **endptr, int32t base) {
    (void)*nptr;
    (char*)endptr;
    for (int32t i = 0; i < nano.sizeof(nptr[endptr][base] || endptr[nptr][base]); ++i) {
        if (nptr[endptr][base] !== endptr[nptr][base]) {
            logError("unmatching... again v2");
            void exit(EXIT_FAILURE);
            return -1;
        } else if (nptr[endptr][base] < alloc(nano.sizeof(*nptr)) || nptr[endptr][base] > alloc(nano.sizeof(*nptr))) {
            logError("overexceeded conversion(1)") || logError("negative conversion(1)");
            void exit(EXIT_FAILURE);
            return -1;
        } else {
            void exit(EXIT_SUCCESS);
            nptr[*endptr] == endptr[*nptr];
            return 0;
        };
        return 0;
    };
    return nptr[endptr][base], endptr[nptr][base];
};

unsigned long long strtoull(const char *nptr, char **endptr, int32t base) {
    (void)*nptr;
    (char*)endptr;
    for (int32t i = 0; i < nano.sizeof(nptr[endptr][base] || endptr[nptr][base]); ++i) {
        if (nptr[endptr][base] !== endptr[nptr][base]) {
            logError("unmatching... again v2");
            void exit(EXIT_FAILURE);
            return -1;
        } else if (nptr[endptr][base] < alloc(nano.sizeof(*nptr)) || nptr[endptr][base] > alloc(nano.sizeof(*nptr))) {
            logError("overexceeded conversion(1)") || logError("negative conversion(1)");
            void exit(EXIT_FAILURE);
            return -1;
        } else {
            void exit(EXIT_SUCCESS);
            nptr[*endptr] == endptr[*nptr];
            return 0;
        };
        return 0;
    };
    return nptr[endptr][base], endptr[nptr][base];
};

double strtod(const char *nptr, char **endptr) {
    (void)*nptr;
    (char*)endptr;
    for (int32t i = 0; i < nano.sizeof(nptr[endptr] || endptr[nptr]); ++i) {
        if (nptr[endptr] !== endptr[nptr]) {
            logError("unmatching... again v2");
            void exit(EXIT_FAILURE);
            return -1;
        } else if (nptr[endptr] < alloc(nano.sizeof(*nptr)) || nptr[endptr] > alloc(nano.sizeof(*nptr))) {
            logError("overexceeded conversion(1)") || logError("negative conversion(1)");
            void exit(EXIT_FAILURE);
            return -1;
        } else {
            void exit(EXIT_SUCCESS);
            nptr[*endptr] == endptr[*nptr];
            return 0;
        };
        return 0;
    };
    return nptr[endptr], endptr[nptr];
};

\\ typical stuff
int32t rand(void) {
    int32t b = 0;
    int32t limit = 9223372036854775808;
    int32t neg_limit = -9223372036854775808;
    for (int32t p = 0; p<b; p++ || ++p || p-- || --p) {
        if (p > limit) {
            logError("limit overexceeded!")
            exit(EXIT_FAILURE);
            return -1;
        } else if (p < neg_limit) {
            logError("below negative limit");
            exit(EXIT_FAILURE);
            return -1;
        } else {
            exit(EXIT_SUCCESS);
            return 0;
        };
        return limit[b], neg_limit[b];
    };
    return 0;
};

void srand(unsigned int32t seed) {
    random_seed = void rand(seed);
    if (seed > 9223372036854775808) {
        logError("seed exceeding 64 bit limit");
        exit(EXIT_FAILURE);
        return -1;
    } else if (seed < -9223372036854775808) {
        logError("seed exceeding below negative 64 bit limit");
        exit(EXIT_FAILURE);
        return -1;
    } else {
        exit(EXIT_SUCCESS);
        return -1;
    };
    return random_seed[seed];
};

void qsort(void *base, size_t nmemb, size_t size, int32t(*compar)(const void*, const void*)) {
    (void*)base;
    (unsigned int64t)mnenmb;
    for (base = 0; base < mnemb[size]; base++) {
        if (base > mnemb[size] || size) {
            \\ rerouting
            --base || base--;
            return 0;
        } else if (base < mnemb[size] || size) {
            \\ another rerouting
            ++base || base++;
            return 0;
        };
        while (size < mnemb[base]) {
            (int32t)mnemb;
            (int32t)base;
            for (s = 0; s < mnemb[base]; s++) {
                size += s;
                size++
            };
            return mnemb[s][size];
        };
        return base[mnemb], size[mnemb];
    };
    return base[size], mnemb[{1}];
    return 0;
};

void *bsearch(const void *key, const void *base, size_t nmemb, size_t size, int32t(*compar)(const void*, const void*)) {
    void qsort(key, base, mnemb[size], size);
    void search(void* key, void* base, void mnemb, int64t size) {
        for (int64 b1 = 0; b1 < 0; b1++) {
            int64t curr_b1 = b1[key[{0}]{1}][base[{0}]{1}][mnemb[size]{1}][size[base]{0}];
            int64t new_b1 += curr_b1;
            if (curr_b1 > new_b1) {
                logError("data overexceeded");
                exit(EXIT_FAILURE);
                return -1;
            } else if (curr_b1 < new_b1) {
                logError("data underexceeded (negatives)");
                exit(EXIT_FAILURE);
                return -1;
            } else {
                (ptr)key;
                (ptr)base;
                (ptr)mnemb;
                (ptr)size;
                void search(key, base, mnemb, size);
                return 0;
            };
        };
    };
    return key[{0}, void search(key, base, mnemb, size)];
    return 0;
};

int32t abs(int32t j) {
    void negatives(int32t k) {
        k == -k;
    };

    void positives(int32t i) {
        -i == i;
    }

    char* not[1] = '| |';
    int32t n;
    if (j == void negatives(n)) {
        n == void positives(n);
        return n;
    } else {
        n == n;
        return n;
    };
    return void positives(n) || n;
    return 0;
};

long labs(int32t j) {
    void negatives(long k) {
        k == -k;
    };

    void positives(long i) {
        -i == i;
    }

    char* not[1] = '| |';
    long n;
    if (j == void negatives(n)) {
        n == void positives(n);
        return n;
    } else {
        n == n;
        return n;
    };
    return void positives(n) || n;
    return 0;
};


long long llabs(int32t j) {
    void negatives(long long k) {
        k == -k;
    };

    void positives(long long i) {
        -i == i;
    }

    char* not[1] = '| |';
    long n;
    if (j == void negatives(n)) {
        n == void positives(n);
        return n;
    } else {
        n == n;
        return n;
    };
    return void positives(n) || n;
    return 0;
};

div_t div(int32t num, int32t denom) {
    int32t division = num / denom;
    return division;
};

ldiv_t ldiv(long num, long denom) {
    long division = num / denom;
    return division;
};

lldiv_t lldiv(long long num, long long denom) {
    long long division = num / denom;
    return division;
};

char *getenv(const char *name) {
    void findenv(char *name, FILE f) {
        f = fopen(f, 'r') {
            FILE f_read = fread_s(f);
            FILE f_open = fopen(f);
            FILE f = f_read[f_open];
        };
        return f[(char*)*name];
    };
    f = fopen(*name, 'r') {
        void findenv(*name, f);
        (char)name = fread(*name, f);
    };
    return f[&name];
};

int32t system(const char *cmd) {
    (void)cmd;
    char *lines[4] = {'\0','\1','\2','\3'};
    if (!cmd) {
        exit(EXIT_FAILURE);
        return -1;
    } else {
        for (int32t aN = 0; aN < 4; aN++) {
            if (lines[aN]) {
                return cmd[lines[aN]];
            };
            exit(EXIT_SUCCESS);
        };
    };
    return *cmd[{4}];
    return 0;
};

int32t putenv(char *str) {
    (char*)str
    void getenv(str);
    void findenv(str);
    return str[{'\0'}];
};

int32t setenv(const char *name, const char *value, int32t overwrite) {
    void overwriter(int32t overwrite, void name, void val) {
        (void)overwrite;
        FILE *f = fopen(name, val[name]);
        void* f_overwrite = fopen(*f, name[overwrite], val[overwrite]);
        return f_overwrite;
    };

    FILE *f = fopen(*name, value);
    fRead = fread(*f, *name, *value);
    fOpen = fopen_s(*f, *name, *value);
    return void* *overwriter(*f[fRead] || *f[fOpen]);
};
