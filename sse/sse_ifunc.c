#include "simd_x86.h"

#include <assert.h>
#include <stdio.h>

/* 3D vector data */
struct vec4
{
    int x;
    int y;
    int z;
    int w;
};

/* Most load/store SSE instructions require 16-byte aligned data, otherwise they may
 * generate General Protection faults
 */
typedef struct vec4 __attribute__ ((aligned(16))) vec4_aligned;
typedef struct vec4 vec4;

typedef enum { FALSE, TRUE } BOOL;

/**
 * @brief Adds two vectors and stores the result in @param result
 * @remarks Unoptimized version
 */
BOOL default_vec4_add(const vec4 *first, const vec4 *second, vec4 *result)
{
#ifdef DEBUG
    printf("Running unoptimized\n");
#endif

    if (!first || !second || !result)
        return FALSE;

    result->x = first->x + second->x;
    result->y = first->y + second->y;
    result->z = first->z + second->z;
    result->w = first->w + second->w;

    return TRUE;
}

/**
 * @brief Adds two vectors and stores the result in @param result
 * @remarks Uses SSE3's _mm_lddqu_si128 for loading unaligned data. @param result
 *  still needs proper alignment
 */
BOOL sse3_vec4_add(const vec4 *first, const vec4 *second, vec4 *result)
{
    __m128i xmm_first;
    __m128i xmm_second;

#ifdef DEBUG
    printf("Running optimized\n");
#endif

    if (!first || !second || !result)
        return FALSE;

    xmm_first = _mm_lddqu_si128((const __m128i*)first);
    xmm_second = _mm_lddqu_si128((const __m128i*)second);
    *((__m128i *)result) = _mm_add_epi32(xmm_first, xmm_second);

    return TRUE;
}

/* Resolver selects either default or optimized method, depending on available SSE support. */
static void *resolve_vec4_add(void)
{
    __builtin_cpu_init ();
    if (__builtin_cpu_supports("sse3")) {
        return sse3_vec4_add;
    } else {
        return default_vec4_add;
    }
}

/* The dispatching technique uses STT_GNU_IFUNC ELF symbol, which instead of pointing to a 
 * function address, it points to a method that returns a function address
 */
BOOL vec4_add(const vec4 *first, const vec4 *second, vec4 *result) __attribute__ ((ifunc("resolve_vec4_add")));

int main()
{
    const vec4 first = { .x = 1, .y = 2, .z = 3, .w = 4 };
    const vec4 second = { .x = 2, .y = 1, .z = 4, .w = 3 };
    vec4_aligned result;

    vec4_add(&first, &second, &result);
    printf("Result: {%d, %d, %d, %d}\n", result.x, result.y, result.z, result.w);
    
    return 0;
}
