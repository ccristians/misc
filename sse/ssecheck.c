#include <stdio.h>

#define STRING_VALUE "%-20s: %s\n"
#define NUMBER_VALUE "%-20s: %d\n"

typedef enum { FALSE, TRUE } BOOL;

/**
 * @brief Returns @code TRUE if CPUID instruction is available on current CPU
 */
BOOL have_cpuid()
{
    int state = 0;
#ifdef _MSC_VER
    /* Intel 64 and IA-32 Architectures Software Developer's Manual, vol. 1, chapter 17.1.2:
     *  Bit 21 (ID) Determines if the processor is able to execute the CPUID instruction. The ability to set and clear
     *  this bit indicates that it is a Pentium 4, Intel Xeon, P6 family, Pentium, or later-version Intel486 processor.
     */
    __asm {
        pushfd              ; Push EFLAGS on the stack
        pop eax             ; Pop EFLAGS to EAX
        mov ecx, eax        ; Save EFLAGS for later comparison
        xor eax, 200000h    ; Toggle bit 21
        push eax
        popfd               ; Set EFLAGS from EAX
        pushfd
        pop eax             ; Reload EFLAGS
        xor eax, ecx        ; Test if bit 21 could be toggled
        mov state, eax
    }
#else
    /* TODO: adapt inline assembly to other configurations */
#error "Cannot detect CPUID presence in current build configuration"
#endif

    /* Clamp value to 0 or 1 */
    return !!state;
}

/**
 * @brief Executes the CPUID instruction and retrieves CPU identification data
 * @param function The function passed in EAX before executing CPUID. This determines the type
 *  of information that CPUID returns
 * @param reg_eax CPUID result from the EAX register
 * @param reg_ebx CPUID result from the EBX register
 * @param reg_ecx CPUID result from the ECX register
 * @param reg_edx CPUID result from the EDX register
 */
void cpuid(int function, int *reg_eax, int *reg_ebx, int *reg_ecx, int *reg_edx)
{
    int areg = 0;
    int breg = 0;
    int creg = 0;
    int dreg = 0;

#ifdef _MSC_VER
    __asm {
        mov eax, function
        cpuid
        mov areg, eax
        mov breg, ebx
        mov creg, ecx
        mov dreg, edx
    }
#else
    /* TODO: adapt inline assembly to other configurations */
#error "Cannot execute CPUID in current build configuration"
#endif

    if (reg_eax)
        *reg_eax = areg;

    if (reg_ebx)
        *reg_ebx = breg;

    if (reg_ecx)
        *reg_ecx = creg;

    if (reg_edx)
        *reg_edx = dreg;
}

int main()
{
    const BOOL cpuid_present = have_cpuid();
    char vendor_string[13];
    int eax, ebx, ecx, edx;

    printf(STRING_VALUE, "Have CPUID", (cpuid_present ? "YES" : "NO"));
    if (!cpuid_present)
        /* Cancel further detection if CPUID is not available */
        return;

    cpuid(0, &eax, (int*)vendor_string, (int*)(vendor_string + 8), (int*)(vendor_string + 4));
    vendor_string[12] = 0;

    /* CPU capabilities check is done using CPUID, as described in Intel 64 and IA-32 Architectures
     * Software Developer's Manual, vol. 2, section "CPUID-CPU Identification"
     */
    printf(NUMBER_VALUE, "Max CPUID function", eax);
    printf(STRING_VALUE, "CPU vendor string", vendor_string);

    if (eax > 0) {
        cpuid(1, &eax, &ebx, &ecx, &edx);
        printf(STRING_VALUE, "Have MMX", (edx & (1u << 23) ? "YES" : "NO"));
        printf(STRING_VALUE, "Have SSE", (edx & (1u << 25) ? "YES" : "NO"));
        printf(STRING_VALUE, "Have SSE2", (edx & (1u << 26) ? "YES" : "NO"));
        printf(STRING_VALUE, "Have SSS3", (ecx & 1u ? "YES" : "NO"));
        printf(STRING_VALUE, "Have SSSE3", (ecx & (1u << 9) ? "YES" : "NO"));
        printf(STRING_VALUE, "Have SSE 4.1", (ecx & (1u << 19) ? "YES" : "NO"));
        printf(STRING_VALUE, "Have SSE 4.2", (ecx & (1u << 20) ? "YES" : "NO"));
        printf(STRING_VALUE, "Have AVX", (ecx & (1u << 28) ? "YES" : "NO"));
    }

    if (eax >= 7) {
        cpuid(7, &eax, &ebx, &ecx, &edx);
        printf(STRING_VALUE, "Have AVX2", (ebx & (1u << 5) ? "YES" : "NO"));
    }

    return 0;
}
