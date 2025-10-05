// hbash.h (NanoC fake terminal API, and also made by GPT LOL)
#ifndef _HBASH_H
#define _HBASH_H

#include <stdint.h>

#define HBASH_BACK_COLOR const char*
#define HBASH_TEXT_COLOR const char*

typedef struct {
    int32_t width;
    int32_t height;
} HBASH;

typedef struct {
    int32_t fontSize;
    int32_t posX;
    int32_t posY;
} HTEXT;

// Terminal control
void Hbash_Init(HBASH shell);
void Hbash_SetBackColor(HBASH_BACK_COLOR color);
void Hbash_SetTextColor(HBASH_TEXT_COLOR color);
void Hbash_PrintText(const char* text, HTEXT layout);

#endif // _HBASH_H
