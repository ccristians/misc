#include <stdio.h>
#include <malloc.h>
#include <intrin.h>
#include <windows.h>

#pragma warning(disable:4996)

#ifndef RUNS
#define RUNS 100000
#endif

int main(int argc, char* argv[])
{
    int i, run;
    int iterations = 0;
    float *vec1;
    float *vec2;
    float *vec3;
    float clock_rate;
    unsigned int dummy = 0;
    unsigned long long tsc1;
    unsigned long long tsc2;
    unsigned long long cycles;
    unsigned long long min_cycles = MAXLONGLONG;
    SYSTEM_INFO sysinfo;

    GetSystemInfo(&sysinfo);

    // Try to prevent context switching
    SetPriorityClass(GetCurrentProcess(), REALTIME_PRIORITY_CLASS);
    SetThreadPriority(GetCurrentThread(), THREAD_PRIORITY_TIME_CRITICAL);

    // Assign process to last core
    // <Note> Test properly to ensure that IRQ servicing is dispached to other cores with
    // greater priority
    SetProcessAffinityMask(GetCurrentProcess(), 1 << (sysinfo.dwNumberOfProcessors - 1));

#ifdef LOOPS
    // Local counter
    iterations = LOOPS;
#else
    // Non-local counter
    if (argc < 2)
        return -1;

    sscanf(argv[1], "%d", &iterations);
    if (iterations < 1)
        return -2;
#endif

    // Estimate CPU clock rate
    tsc1 = __rdtscp(&dummy);
    Sleep(1000);
    tsc2 = __rdtscp(&dummy);
    cycles = tsc2 - tsc1;

    clock_rate = (float)cycles / 1000000.0f;
    printf("CPU: %d cores, clock rate: %llu clocks/sec (%.1f Mhz)\n", sysinfo.dwNumberOfProcessors, cycles, clock_rate);

    // Set up vectors
#ifdef VECTORIZE
    // 16 byte alignment required for SSE operation
    vec1 = (float*)_aligned_malloc(iterations * sizeof(float), 16);
    vec2 = (float*)_aligned_malloc(iterations * sizeof(float), 16);
    vec3 = (float*)_aligned_malloc(iterations * sizeof(float), 16);
#else
    vec1 = (float*)malloc(iterations * sizeof(float));
    vec2 = (float*)malloc(iterations * sizeof(float));
    vec3 = (float*)malloc(iterations * sizeof(float));
#endif
    for (i = 0; i < iterations; i++) {
        vec1[i] = i / 2.0f;
        vec2[i] = i * 1.5f;
    }

    cycles = 0;
    for (run = 0; run < RUNS; run++) {
        unsigned long long current_cycles = 0;
#ifdef VECTORIZE
        __m128 *vec1a = (__m128*)vec1; // 16-byte aligned
        __m128 *vec2a = (__m128*)vec2; // 16-byte aligned
        __m128 *vec3a = (__m128*)vec3; // 16-byte aligned
#endif

        // Perform and measure vector operations
        tsc1 = __rdtscp(&dummy);

#ifdef VECTORIZE
        for (i = 0; i < iterations / 4; i += 2) {
            vec3a[i] = _mm_add_ps(vec1a[i], vec2a[i]);
            vec3a[i + 1] = _mm_add_ps(vec1a[i + 1], vec2a[i + 1]);
        }
#else
        for (i = 0; i < iterations; i++)
            vec3[i] = vec1[i] + vec2[i];
#endif
        tsc2 = __rdtscp(&dummy);

        current_cycles = tsc2 - tsc1;
        cycles += current_cycles;

        if (current_cycles < min_cycles)
            min_cycles = current_cycles;
    }

    cycles /= RUNS;
    printf("Duration: cycles=%llu (%d runs, %d iterations)\n", cycles, RUNS, iterations);

#ifdef VECTORIZE
    _aligned_free(vec1);
    _aligned_free(vec2);
    _aligned_free(vec3);
#else
    free(vec1);
    free(vec2);
    free(vec3);
#endif
}

