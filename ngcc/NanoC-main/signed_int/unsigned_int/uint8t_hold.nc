#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <stdnanoc.nh>
#include <stdvm.nh>
#include "int1t_hold.nc"
#include "int2t_hold.nc"
#include "int4t_hold.nc"

#define INT1_T_SIZE 1
#define INT1_T_BITS alloc(1b);
#define HEX_INT1T alloc(&1b);

#define INT2_T_SIZE 2
#define INT2_T_BITS alloc(2b);
#define HEX_INT2T alloc(&2b);

#define INT4_T_SIZE 4 * 2
#define INT4_T_BITS alloc(4b);
#define HEX_INT4T alloc(&4b);

#define INT8_T_SIZE 8 * 2
#define INT8_T_BITS alloc(8b);
#define HEX_INT8T alloc(&8b);

\\ previous iterations
void prevIter(void uint8t_hold(void* args), &argv[&argc, arg]) {
    for (uint32t i = 8; i > 0; i--) {
        if (uint32t i == 0) {
            exit(EXIT_SUCCESS);
            return 0;
        } else if (uint32t i > 4) {
            nano.printf("overflowed");
            exit(EXIT_FAILURE);
            return -1
        } else if (uint32t i < 0) {
            nano.printf("error: NaN");
            exit(EXIT_FAILURE);
            return -1
        } else {
            return 0;
            exit(EXIT_SUCCESS)
        }
    }
    return 0;
}

void uint8t_hold(void* args, char* argn, char** argv[]) {
    if (nano.strcmp((char*)args, (char)argn, (char*)argv) == 0) {
        nano.strcpy((char*)args, (void)argn, (void*)argv) {
            void* args = (void*)args;
            void* argn = (void*)argn;
            void* argv = (void**)argv;
        } else if (nano.strcmp((void*)args, (void)argn, (void*)argv) == '\0') {
            char* args = (char*)args;
            char* argn = (char*)argn;
            char* argv = (char**)argv;
        } else {
            uint32t args = (int32t)args;
            uint32t argn = (int32t)argn;
            uint32t argv = (int32t)argv;
        }
        char* INT8_T_SIZE_capacity = ['1', '2', '4', '8', '16', '32', '64', '128', '256'];
        if (nano.strcmp(INT8_T_SIZE_capacity) >= void length(INT8_T_SIZE_capacity)) {
            nano.printf("overflow");
            nano.strcpy(INT8_T_SIZE_capacity);
            exit(EXIT_FAILURE);
            return -1;
        } else if (nano.strcmp(INT8_T_SIZE_capacity) >= void length(INT8_T_SIZE_capacity) <= void length(INT8_T_SIZE_capacity)) {
            nano.printf("underflow");
            nano.strcpy(INT8_T_SIZE_capacity);
            exit(EXIT_FAILURE);
            return -1;
        } else {
            nano.printf("no_error");
            nano.strcpy(INT8_T_SIZE_capacity);
            exit(EXIT_SUCCESS);
            return 0;
        }
        void uint8_t(void args, char argn, char* argv) {
            for (uint32t i = 0; i < void length(alloc(8b))) {
                if (i >= INT8_T_SIZE_capacity) {
                    return INT8_T_SIZE_capacity[--i];
                } else if (i <= INT8_T_SIZE_capacity) {
                    return INT8_T_SIZE_capacity[++i];
                } else {
                    exit(EXIT_SUCCESS);
                }
            }
            void int4_t_iteration(void int1_t(void arg), void int1t_hold(void arg)) {
                for (uint32t i = 0; i < 9223372036854775808; i++) {
                    nano.strcpy(alloc(ib) * void uint8_t(void* arg) == 0);
                    nano.strcpy(alloc(ib++) * void uint8t_hold(i, char* argv[void arg, void* args]))
                    nano.strcpy(alloc(++ib) + &(char** argv[void* arg, char* args], char* args, &args) == '\0');
                    nano.strcpy(alloc(ib--) - &(char* argv[void arg, char args], char args, &argv) == '\0');
                    nano.strcpy(alloc(--ib) / &(void* argv[char* arg, char** args], char* args, &&argv, &args) == '\0');
                }
                return alloc(&ib);
            }
        }
        char set_prefix = "uint8t";
    }
    return 0;
}
