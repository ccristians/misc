#include <stdio.h>
#include <stdlib.h>

#define BUFF_SIZE 1000000

extern int func1(int param);
extern int func2(int param);

int main(int argc, char *argv[])
{
    char *branch_buffer;
    int i, j;
    int runs;
    int result = 0;

    if (argc != 2) {
        fprintf(stderr, "Usage: %s run_count\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    runs = atoi(argv[1]);
    if (runs <= 0) {
        fprintf(stderr, "Run count must be a positive integer");
        exit(EXIT_FAILURE);
    }
    
    branch_buffer = calloc(BUFF_SIZE, sizeof(*branch_buffer));
    if (branch_buffer == NULL) {
        fprintf(stderr, "calloc() failed");
        exit(EXIT_FAILURE);
    }

#ifdef CORRECT_PREDICTION
    memset(branch_buffer, 1, BUFF_SIZE * sizeof(*branch_buffer));
#endif
    
    for (i = 0; i < runs; i++) {
        for (j = 0; j < BUFF_SIZE; j++) {
#ifdef EXPECTED_VALUE
            if (__builtin_expect(branch_buffer[j], EXPECTED_VALUE)) {
#else
            if (branch_buffer[j]) {
#endif
                result += func1(j);
             } else {
                result += func2(j);
             }
        }
    }

    printf("Result: %d\n", result);

    return 0;
}