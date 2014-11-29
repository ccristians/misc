#ifndef _SIMD_X86_H
#define _SIMD_X86_H

/* 
 * This header includes SIMD features that were enabled by the compiler.
 * Currently works with recent GCC, clang and MSVC compilers.
 */

/* Compiler/version probing */
#ifndef CC_VERSION
#   ifdef _MSC_VER
/* _MSC_VER values: 
 *  1800: MSVC++ 12.0 (Visual Studio 2013)
 *  1700: MSVC++ 11.0 (Visual Studio 2012)
 *  1600: MSVC++ 10.0 (Visual Studio 2010)
 *  1500: MSVC++ 9.0  (Visual Studio 2008)
 *  1400: MSVC++ 8.0  (Visual Studio 2005)
 *  1310: MSVC++ 7.1  (Visual Studio 2003)
 */
#       define CC_MSVC
#       define CC_VERSION _MSC_VER
#   elif defined (__clang__)
#       define CC_CLANG
#       define CC_VERSION (__clang_major__ * 10000 + __clang_minor__ * 100 + __clang_patchlevel__)
#   elif defined (__GNUC__)
#       define CC_GCC
#       define CC_VERSION (__GNUC__ * 10000 + __GNUC_MINOR__ * 100 + __GNUC_PATCHLEVEL__)
#   endif
#endif

/* Definitions for available features */
#ifdef CC_MSVC
/* All x86 CPUs since Pentium have MMX */
#   if defined(_M_IX86) && _M_IX86 >= 500
#       define __MMX__
#   endif
/* All 64bit x86 architectures support SSE and SSE2 */
#   if defined(_M_AMD64) || defined(_M_X64)
#       define __SSE__ 1
#       define __SSE2__ 1
#   endif 
/* Use options specified in the /arch switch to enable features */
#   if !defined(__AVX__) && !defined(__AVX2__)
#       if _M_IX86_FP >= 1
#           undef __SSE__
#           define __SSE__ 1
#	    endif
#       if _M_IX86_FP >= 2
#           undef __SSE2__
#           define __SSE2__ 1
#       endif
#   endif
/* Visual Studio 2013 defines __AVX__ and __AVX2__ when using the corresponding /arch switch.
 * Manual inclusion of headers is required for previous versions, when using features newer than SSE2.
 */
#   if CC_VERSION >= 1800
#       if defined(__AVX__) || defined(__AVX2__)
#           define __SSE3__ 1
#           define __SSSE3__ 1
#           define __SSE4_1__ 1
#           define __SSE4_2__ 1
#           undef __AVX__
#           define __AVX__ 1
#           undef __AVX2__
#           define __AVX2__ 1
#       endif
#   endif
#elif (defined(CC_GCC) && CC_VERSION >= 40400) || (defined(CC_CLANG) && CC_VERSION >= 20800)
/* GCC >= 4.4 and clang >= 2.8 provide x86intrin.h, which includes all suported SSE headers.
 * Also, they provide macro definitions for enabled SIMD features (__SSE__, __AVX__, etc.)
 */
#   include <x86intrin.h>
#   define CC_SIMD_INCLUDED
#endif

#if defined(__MMX__) && !defined(CC_SIMD_INCLUDED)
#include <mmintrin.h>
#endif

#if defined(__SSE__) && !defined(CC_SIMD_INCLUDED)
#include <xmmintrin.h>
#endif

#if defined(__SSE2__) && !defined(CC_SIMD_INCLUDED)
#include <emmintrin.h>
#endif

#if defined(__SSSE3__) && !defined(CC_SIMD_INCLUDED)
#include <pmmintrin.h>
#endif
    
#if defined(__SSSE3__) && !defined(CC_SIMD_INCLUDED)
#include <tmmintrin.h>
#endif

#if defined(__SSE4_1__) && !defined(CC_SIMD_INCLUDED)
#include <smmintrin.h>
#endif

#if defined(__SSE4_2__) && !defined(CC_SIMD_INCLUDED)
#include <nmmintrin.h>
#endif

#if (defined(__AVX__) || defined(__AVX2__)) && !defined(CC_SIMD_INCLUDED)
#include <immintrin.h>
#endif

#endif /* _SIMD_X86_H */
