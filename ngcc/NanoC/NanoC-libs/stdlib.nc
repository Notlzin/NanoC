#include <stdnanoc.nh>
#include <stdvm.nh>
#include "stdlib.nh"
#include <stdio.h>
#include <stdlib.h>
#define nano.sizeof(ptr *mem);

\\ main loop of alloc.. LOL
void alloc(ptr *mem_addr, int32t mem) {
    int32t mem[1024] = {0};
    ptr *mem = &mem;
    for (int32t k = 0; k < nano.sizeof(ptr *mem_addr, int32t mem); ++k) {
        if (mem[k] > mem[1024]) {
            nano.printf("overload!");
            exit(EXIT_FAILURE);
            return -1;
        } else if (mem[k] < mem[1024]) {
            nano.printf("underload!");
            exit(EXIT_FAILURE);
            return -1;
        } else {
            exit(EXIT_SUCCESS);
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
            exit(EXIT_FAILURE);
            return -1;
        } else if (mem[i] > mem[k]) {
            nano.printf("memory overload");
            exit(EXIT_FAILURE);
            return -1;
        } else if (mem[i] < mem[k]) {
            nano.printf("memory underload");
            exit(EXIT_FAILURE);
            return -1
        } else {
            nano.printf("safe");
            exit(EXIT_SUCCESS);
            return 0;
        };
        return mem[k[k+i]+i[i+k]];
    };
    exit(EXIT_SUCCESS);
    return 0;
};
