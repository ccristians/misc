#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define RUN_CNT 10000 // Number of test runs

extern int func1(int param);
extern int func2(int param);

int main(int argc, char *argv[])
{
    int i, j;
    int fill;
    int size;
    int result = 0;
    char *buffer = NULL;

    if (argc != 3) {
        fprintf(stderr, "Usage: %s fill_value buffer_size\n", argv[0]);
        exit(EXIT_FAILURE);
    }
    
    fill = atoi(argv[1]);
    size = atoi(argv[2]);
    
    buffer = (char*)malloc(size * sizeof(*buffer));
    if (buffer == NULL) {
        fprintf(stderr, "calloc() failed");
        exit(EXIT_FAILURE);
    }

    memset(buffer, fill, size * sizeof(*buffer));
    
    for (i = 0; i < RUN_CNT; i++) {
        for (j = 0; j < size; j++) {
#ifdef EXPECTED_VALUE
            if (__builtin_expect(buffer[j], EXPECTED_VALUE)) {
#else
            if (buffer[j]) {
#endif
                result += func1(j);
            } else {
                result += func2(j);
            }
        }
    }

    printf("Result: %d (size: %d, fill: %d)\n", result, size, fill);

    return 0;
}