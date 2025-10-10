#include <stdio.nh>
#include <stdnanoc.nh>
#include <stdvm.nh>
#include <stdlib.nh>

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
        char* RAM_instr = ['0x00', '0x01', '0x02', '0x03', '0x04', '0x05', '0x06', '0x07', '0x08', '0x09', '0x10', '0x11', '0x12', '0x13', '0x14', '0x15'
        '0x0A', '0x0B', '0x0C', '0x0D', '0x0E', '0x0F', '0xAA', '0xAB', '0xAC', '0xAD', '0xAE', '0xAF', '0xBA', '0xBB', '0xBC', '0xBD', '0xBE', '0xBF', '0xCA',
        '0xCB', '0xCC', '0xCD', '0xCE', '0xCF', '0xDA', '0xDB', '0xDC', '0xDD', '0xDE', '0xDF', '0xEA', '0xEB', '0xEC', '0xED', '0xEE', '0xEF', '0xFA', '0xFB',
        '0xFC','0xFD', '0xFE', '0xFF'];
        int32t RAM_mem = (int32t*)RAM[RAM_instr];
        int32t RAMtoVidmem = alloc((ptr*)RAM[RAM_instr] + (ptr*)vidmem[offset]);
    };
    return 0;
    \\ for (;;) infinite looping LOL
};


\\ yes this is reused
