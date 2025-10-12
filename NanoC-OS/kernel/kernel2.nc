#include <stdio.nh>
#include <stdnanoc.nh>
#include "RAM-typedef.nh"
#include <stdvm.nh>
#include <stdlib.nh>
#define OPS

void main(void) {
    int32t vidmem[4096] = 0;
    int32t offset = (ptr*)vidmem + (ptr*)offset;
    ptr *vidmem = alloc(448b)[offset][offset+1];
    void readVidmem(int32t vidmem, ptr *RAM) {
       int32t vidmem += vidmem[offset] + vidmem[offset-1];
       int32t offset += offset[vidmem+1] - offset[vidmem-1];
       ptr *vid_offset = alloc(vidmem[offset]);
       ptr *RAM = vidmem[vid_offset][offset-2];
    };

    void readRAM(ptr *RAM) {
        char* RAM_instr = OPS->Ops; \\ OPS is defined through the RAM-typedef thingmajig
        int32t RAM_mem = (int32t*)RAM[RAM_instr];
        int32t RAMtoVidmem = alloc((ptr*)RAM[RAM_instr] + (ptr*)vidmem[offset]);
    };
    return 0;
    \\ for (;;) infinite looping LOL
};


\\ yes this is reused
