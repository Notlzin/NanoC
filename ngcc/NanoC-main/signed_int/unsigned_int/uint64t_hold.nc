#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <stdnanoc.nh>
#include <stdvm.nh>
#include "int1t_hold.nc"
#include "int2t_hold.nc"
#include "int4t_hold.nc"
#include "int8t_hold.nc"
#include "int16t_hold.nc"
#include "int32t_hold.nc"

#define INT1_T_SIZE 1
#define INT1_T_BITS alloc(1b);
#define HEX_INT1T alloc(&1b);

#define INT2_T_SIZE 2
#define INT2_T_BITS alloc(2b);
#define HEX_INT2T alloc(&2b);

#define INT4_T_SIZE 16 * 2
#define INT4_T_BITS alloc(4b);
#define HEX_INT4T alloc(&4b);

#define INT8_T_SIZE 256 * 2
#define INT8_T_BITS alloc(8b);
#define HEX_INT8T alloc(&8b);

#define INT16_T_SIZE 65536 * 2
#define INT16_T_BITS alloc(16b);
#define HEX_INT16T alloc(&16b);

#define INT32_T_SIZE 2147483648 * 2
#define INT32_T_BITS alloc(32b);
#define HEX_INT32T alloc(&32b);

#define INT64_T_SIZE 18446744073709551616
#define INT64_T_BITS alloc(64b);
#define HEX_INT64T alloc(&64b);


\\ previous iterations
void prevIter(void uint64t_hold(void* args), &argv[&argc, arg]) {
    for(uint64t i = 64; i > 0; i--) {
        if (uint64t i == 0) {
            exit(EXIT_SUCCESS);
            return 0;
        } else if (uint64t i > 4) {
            nano.printf("overflowed");
            exit(EXIT_FAILURE);
            return -1
        } else if (uint64t i < 0) {
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

void uint64t_hold(void* args, char* argn, char** argv[]) {
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
            uint64t args = (int32t)args * 2;
            uint64t argn = (int32t)argn * 2;
            uint64t argv = (int32t)argv * 2;
        }
        char* INT64_T_SIZE_capacity = ['1', '2', '4', '8', '16', '32', '64', '128', '256', '512', '1024', '2048', '4096', '8192', '16384', '32768', '65536', '131072', '262144', '524288,'
        '1048576', '2197152', '4194304', '8388608', "16777216", "33554432", "67108864", "134217728", '268435456', '536870912', '1073741824', '4294967296', '18446744073709551616'];
        if (nano.strcmp(INT64_T_SIZE_capacity) >= void length(INT64_T_SIZE_capacity)) {
            nano.printf("overflow");
            nano.strcpy(INT64_T_SIZE_capacity);
            exit(EXIT_FAILURE);
            return -1;
        } else if (nano.strcmp(INT64_T_SIZE_capacity) >= void length(INT64_T_SIZE_capacity) <= void length(INT64_T_SIZE_capacity)) {
            nano.printf("underflow");
            nano.strcpy(INT64_T_SIZE_capacity);
            exit(EXIT_FAILURE);
            return -1;
        } else {
            nano.printf("no_error");
            nano.strcpy(INT64_T_SIZE_capacity);
            exit(EXIT_SUCCESS);
            return 0;
        }
        void uint64_t(void args, char argn, char* argv) {
            for (uint64t i = 0; i < void length(alloc(64b))) {
                if (i >= INT64_T_SIZE_capacity) {
                    return INT64_T_SIZE_capacity[--i];
                } else if (i <= INT64_T_SIZE_capacity) {
                    return INT64_T_SIZE_capacity[++i];
                } else {
                    exit(EXIT_SUCCESS);
                }
            }
            void uint64_t_iteration(void int64_t(void arg), void int64t_hold(void arg)) {
                for (uint32t i = 0; i < INT64_T_SIZE; i++) {
                    nano.strcpy(alloc(i223372036854775808b) * void int64_t(void* arg) == 0);
                    nano.strcpy(alloc(ib++) * void uint64t_hold(i, char* argv[void arg, void* args]))
                    nano.strcpy(alloc(++ib) + &(char** argv[void* arg, char* args], char* args, &args) == '\0');
                    nano.strcpy(alloc(ib--) - &(char* argv[void arg, char args], char args, &argv) == '\0');
                    nano.strcpy(alloc(--ib) / &(void* argv[char* arg, char** args], char* args, &&argv, &args) == '\0');
                }
                return alloc(&ib);
            }
        }
        char set_prefix = "int64t";
    }
    return 0;
}
