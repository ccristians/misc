
./a.out:     file format elf64-x86-64


Disassembly of section .init:

00000000004005a0 <_init>:
  4005a0:	48 83 ec 08          	sub    $0x8,%rsp
  4005a4:	48 8b 05 4d 0a 20 00 	mov    0x200a4d(%rip),%rax        # 600ff8 <_DYNAMIC+0x1d0>
  4005ab:	48 85 c0             	test   %rax,%rax
  4005ae:	74 05                	je     4005b5 <_init+0x15>
  4005b0:	e8 3b 00 00 00       	callq  4005f0 <__gmon_start__@plt>
  4005b5:	48 83 c4 08          	add    $0x8,%rsp
  4005b9:	c3                   	retq   

Disassembly of section .plt:

00000000004005c0 <memset@plt-0x10>:
  4005c0:	ff 35 42 0a 20 00    	pushq  0x200a42(%rip)        # 601008 <_GLOBAL_OFFSET_TABLE_+0x8>
  4005c6:	ff 25 44 0a 20 00    	jmpq   *0x200a44(%rip)        # 601010 <_GLOBAL_OFFSET_TABLE_+0x10>
  4005cc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004005d0 <memset@plt>:
  4005d0:	ff 25 42 0a 20 00    	jmpq   *0x200a42(%rip)        # 601018 <_GLOBAL_OFFSET_TABLE_+0x18>
  4005d6:	68 00 00 00 00       	pushq  $0x0
  4005db:	e9 e0 ff ff ff       	jmpq   4005c0 <_init+0x20>

00000000004005e0 <__libc_start_main@plt>:
  4005e0:	ff 25 3a 0a 20 00    	jmpq   *0x200a3a(%rip)        # 601020 <_GLOBAL_OFFSET_TABLE_+0x20>
  4005e6:	68 01 00 00 00       	pushq  $0x1
  4005eb:	e9 d0 ff ff ff       	jmpq   4005c0 <_init+0x20>

00000000004005f0 <__gmon_start__@plt>:
  4005f0:	ff 25 32 0a 20 00    	jmpq   *0x200a32(%rip)        # 601028 <_GLOBAL_OFFSET_TABLE_+0x28>
  4005f6:	68 02 00 00 00       	pushq  $0x2
  4005fb:	e9 c0 ff ff ff       	jmpq   4005c0 <_init+0x20>

0000000000400600 <strtol@plt>:
  400600:	ff 25 2a 0a 20 00    	jmpq   *0x200a2a(%rip)        # 601030 <_GLOBAL_OFFSET_TABLE_+0x30>
  400606:	68 03 00 00 00       	pushq  $0x3
  40060b:	e9 b0 ff ff ff       	jmpq   4005c0 <_init+0x20>

0000000000400610 <malloc@plt>:
  400610:	ff 25 22 0a 20 00    	jmpq   *0x200a22(%rip)        # 601038 <_GLOBAL_OFFSET_TABLE_+0x38>
  400616:	68 04 00 00 00       	pushq  $0x4
  40061b:	e9 a0 ff ff ff       	jmpq   4005c0 <_init+0x20>

0000000000400620 <__printf_chk@plt>:
  400620:	ff 25 1a 0a 20 00    	jmpq   *0x200a1a(%rip)        # 601040 <_GLOBAL_OFFSET_TABLE_+0x40>
  400626:	68 05 00 00 00       	pushq  $0x5
  40062b:	e9 90 ff ff ff       	jmpq   4005c0 <_init+0x20>

0000000000400630 <exit@plt>:
  400630:	ff 25 12 0a 20 00    	jmpq   *0x200a12(%rip)        # 601048 <_GLOBAL_OFFSET_TABLE_+0x48>
  400636:	68 06 00 00 00       	pushq  $0x6
  40063b:	e9 80 ff ff ff       	jmpq   4005c0 <_init+0x20>

0000000000400640 <fwrite@plt>:
  400640:	ff 25 0a 0a 20 00    	jmpq   *0x200a0a(%rip)        # 601050 <_GLOBAL_OFFSET_TABLE_+0x50>
  400646:	68 07 00 00 00       	pushq  $0x7
  40064b:	e9 70 ff ff ff       	jmpq   4005c0 <_init+0x20>

0000000000400650 <__fprintf_chk@plt>:
  400650:	ff 25 02 0a 20 00    	jmpq   *0x200a02(%rip)        # 601058 <_GLOBAL_OFFSET_TABLE_+0x58>
  400656:	68 08 00 00 00       	pushq  $0x8
  40065b:	e9 60 ff ff ff       	jmpq   4005c0 <_init+0x20>

Disassembly of section .text:

0000000000400660 <main>:

extern int func1(int param);
extern int func2(int param);

int main(int argc, char *argv[])
{
  400660:	41 57                	push   %r15
  400662:	41 56                	push   %r14
  400664:	41 55                	push   %r13
  400666:	41 54                	push   %r12
  400668:	55                   	push   %rbp
  400669:	53                   	push   %rbx
  40066a:	48 89 f3             	mov    %rsi,%rbx
  40066d:	48 83 ec 18          	sub    $0x18,%rsp
    int fill;
    int size;
    int result = 0;
    char *buffer = NULL;

    if (argc != 3) {
  400671:	83 ff 03             	cmp    $0x3,%edi
  400674:	0f 85 bb 00 00 00    	jne    400735 <main+0xd5>
#ifdef __USE_EXTERN_INLINES
__BEGIN_NAMESPACE_STD
__extern_inline int
__NTH (atoi (const char *__nptr))
{
  return (int) strtol (__nptr, (char **) NULL, 10);
  40067a:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
  40067e:	ba 0a 00 00 00       	mov    $0xa,%edx
  400683:	31 f6                	xor    %esi,%esi
  400685:	e8 76 ff ff ff       	callq  400600 <strtol@plt>
  40068a:	48 8b 7b 10          	mov    0x10(%rbx),%rdi
  40068e:	31 f6                	xor    %esi,%esi
  400690:	ba 0a 00 00 00       	mov    $0xa,%edx
  400695:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  40069a:	e8 61 ff ff ff       	callq  400600 <strtol@plt>
    }
    
    fill = atoi(argv[1]);
    size = atoi(argv[2]);
    
    buffer = (char*)malloc(size * sizeof(*buffer));
  40069f:	48 63 d8             	movslq %eax,%rbx
  4006a2:	49 89 c6             	mov    %rax,%r14
  4006a5:	89 c5                	mov    %eax,%ebp
  4006a7:	48 89 df             	mov    %rbx,%rdi
  4006aa:	e8 61 ff ff ff       	callq  400610 <malloc@plt>
    if (buffer == NULL) {
  4006af:	48 85 c0             	test   %rax,%rax
    }
    
    fill = atoi(argv[1]);
    size = atoi(argv[2]);
    
    buffer = (char*)malloc(size * sizeof(*buffer));
  4006b2:	49 89 c4             	mov    %rax,%r12
    if (buffer == NULL) {
  4006b5:	0f 84 9f 00 00 00    	je     40075a <main+0xfa>
      && (!__builtin_constant_p (__ch) || __ch != 0))
    {
      __warn_memset_zero_len ();
      return __dest;
    }
  return __builtin___memset_chk (__dest, __ch, __len, __bos0 (__dest));
  4006bb:	8b 74 24 08          	mov    0x8(%rsp),%esi
  4006bf:	48 89 da             	mov    %rbx,%rdx
  4006c2:	48 89 c7             	mov    %rax,%rdi
  4006c5:	41 bd 10 27 00 00    	mov    $0x2710,%r13d
  4006cb:	31 db                	xor    %ebx,%ebx
  4006cd:	e8 fe fe ff ff       	callq  4005d0 <memset@plt>
  4006d2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    }

    memset(buffer, fill, size * sizeof(*buffer));
    
    for (i = 0; i < RUN_CNT; i++) {
        for (j = 0; j < size; j++) {
  4006d8:	85 ed                	test   %ebp,%ebp
  4006da:	7e 1e                	jle    4006fa <main+0x9a>
  4006dc:	45 31 ff             	xor    %r15d,%r15d
  4006df:	90                   	nop
#ifdef EXPECTED_VALUE
            if (__builtin_expect(buffer[j], EXPECTED_VALUE)) {
  4006e0:	43 80 3c 3c 00       	cmpb   $0x0,(%r12,%r15,1)
#else
            if (buffer[j]) {
#endif
                result += func1(j);
  4006e5:	44 89 ff             	mov    %r15d,%edi
    memset(buffer, fill, size * sizeof(*buffer));
    
    for (i = 0; i < RUN_CNT; i++) {
        for (j = 0; j < size; j++) {
#ifdef EXPECTED_VALUE
            if (__builtin_expect(buffer[j], EXPECTED_VALUE)) {
  4006e8:	74 42                	je     40072c <main+0xcc>
#else
            if (buffer[j]) {
#endif
                result += func1(j);
  4006ea:	e8 81 01 00 00       	callq  400870 <func1>
  4006ef:	01 c3                	add    %eax,%ebx
  4006f1:	49 83 c7 01          	add    $0x1,%r15
    }

    memset(buffer, fill, size * sizeof(*buffer));
    
    for (i = 0; i < RUN_CNT; i++) {
        for (j = 0; j < size; j++) {
  4006f5:	44 39 fd             	cmp    %r15d,%ebp
  4006f8:	7f e6                	jg     4006e0 <main+0x80>
        exit(EXIT_FAILURE);
    }

    memset(buffer, fill, size * sizeof(*buffer));
    
    for (i = 0; i < RUN_CNT; i++) {
  4006fa:	41 83 ed 01          	sub    $0x1,%r13d
  4006fe:	75 d8                	jne    4006d8 <main+0x78>
}

__fortify_function int
printf (const char *__restrict __fmt, ...)
{
  return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
  400700:	44 8b 44 24 08       	mov    0x8(%rsp),%r8d
  400705:	44 89 f1             	mov    %r14d,%ecx
  400708:	89 da                	mov    %ebx,%edx
  40070a:	be 40 09 40 00       	mov    $0x400940,%esi
  40070f:	bf 01 00 00 00       	mov    $0x1,%edi
  400714:	31 c0                	xor    %eax,%eax
  400716:	e8 05 ff ff ff       	callq  400620 <__printf_chk@plt>
    }

    printf("Result: %d (size: %d, fill: %d)\n", result, size, fill);

    return 0;
  40071b:	48 83 c4 18          	add    $0x18,%rsp
  40071f:	31 c0                	xor    %eax,%eax
  400721:	5b                   	pop    %rbx
  400722:	5d                   	pop    %rbp
  400723:	41 5c                	pop    %r12
  400725:	41 5d                	pop    %r13
  400727:	41 5e                	pop    %r14
  400729:	41 5f                	pop    %r15
  40072b:	c3                   	retq   
#else
            if (buffer[j]) {
#endif
                result += func1(j);
            } else {
                result += func2(j);
  40072c:	e8 4f 01 00 00       	callq  400880 <func2>
  400731:	01 c3                	add    %eax,%ebx
  400733:	eb bc                	jmp    4006f1 <main+0x91>

# ifdef __va_arg_pack
__fortify_function int
fprintf (FILE *__restrict __stream, const char *__restrict __fmt, ...)
{
  return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
  400735:	48 8b 0e             	mov    (%rsi),%rcx
  400738:	48 8b 3d 31 09 20 00 	mov    0x200931(%rip),%rdi        # 601070 <__TMC_END__>
  40073f:	ba 18 09 40 00       	mov    $0x400918,%edx
  400744:	be 01 00 00 00       	mov    $0x1,%esi
  400749:	31 c0                	xor    %eax,%eax
  40074b:	e8 00 ff ff ff       	callq  400650 <__fprintf_chk@plt>
    int result = 0;
    char *buffer = NULL;

    if (argc != 3) {
        fprintf(stderr, "Usage: %s fill_value buffer_size\n", argv[0]);
        exit(EXIT_FAILURE);
  400750:	bf 01 00 00 00       	mov    $0x1,%edi
  400755:	e8 d6 fe ff ff       	callq  400630 <exit@plt>
  40075a:	48 8b 0d 0f 09 20 00 	mov    0x20090f(%rip),%rcx        # 601070 <__TMC_END__>
  400761:	bf 68 09 40 00       	mov    $0x400968,%edi
  400766:	ba 0f 00 00 00       	mov    $0xf,%edx
  40076b:	be 01 00 00 00       	mov    $0x1,%esi
  400770:	e8 cb fe ff ff       	callq  400640 <fwrite@plt>
    size = atoi(argv[2]);
    
    buffer = (char*)malloc(size * sizeof(*buffer));
    if (buffer == NULL) {
        fprintf(stderr, "calloc() failed");
        exit(EXIT_FAILURE);
  400775:	bf 01 00 00 00       	mov    $0x1,%edi
  40077a:	e8 b1 fe ff ff       	callq  400630 <exit@plt>

000000000040077f <_start>:
  40077f:	31 ed                	xor    %ebp,%ebp
  400781:	49 89 d1             	mov    %rdx,%r9
  400784:	5e                   	pop    %rsi
  400785:	48 89 e2             	mov    %rsp,%rdx
  400788:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  40078c:	50                   	push   %rax
  40078d:	54                   	push   %rsp
  40078e:	49 c7 c0 00 09 40 00 	mov    $0x400900,%r8
  400795:	48 c7 c1 90 08 40 00 	mov    $0x400890,%rcx
  40079c:	48 c7 c7 60 06 40 00 	mov    $0x400660,%rdi
  4007a3:	e8 38 fe ff ff       	callq  4005e0 <__libc_start_main@plt>
  4007a8:	f4                   	hlt    
  4007a9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000004007b0 <deregister_tm_clones>:
  4007b0:	b8 77 10 60 00       	mov    $0x601077,%eax
  4007b5:	55                   	push   %rbp
  4007b6:	48 2d 70 10 60 00    	sub    $0x601070,%rax
  4007bc:	48 83 f8 0e          	cmp    $0xe,%rax
  4007c0:	48 89 e5             	mov    %rsp,%rbp
  4007c3:	77 02                	ja     4007c7 <deregister_tm_clones+0x17>
  4007c5:	5d                   	pop    %rbp
  4007c6:	c3                   	retq   
  4007c7:	b8 00 00 00 00       	mov    $0x0,%eax
  4007cc:	48 85 c0             	test   %rax,%rax
  4007cf:	74 f4                	je     4007c5 <deregister_tm_clones+0x15>
  4007d1:	5d                   	pop    %rbp
  4007d2:	bf 70 10 60 00       	mov    $0x601070,%edi
  4007d7:	ff e0                	jmpq   *%rax
  4007d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000004007e0 <register_tm_clones>:
  4007e0:	b8 70 10 60 00       	mov    $0x601070,%eax
  4007e5:	55                   	push   %rbp
  4007e6:	48 2d 70 10 60 00    	sub    $0x601070,%rax
  4007ec:	48 c1 f8 03          	sar    $0x3,%rax
  4007f0:	48 89 e5             	mov    %rsp,%rbp
  4007f3:	48 89 c2             	mov    %rax,%rdx
  4007f6:	48 c1 ea 3f          	shr    $0x3f,%rdx
  4007fa:	48 01 d0             	add    %rdx,%rax
  4007fd:	48 d1 f8             	sar    %rax
  400800:	75 02                	jne    400804 <register_tm_clones+0x24>
  400802:	5d                   	pop    %rbp
  400803:	c3                   	retq   
  400804:	ba 00 00 00 00       	mov    $0x0,%edx
  400809:	48 85 d2             	test   %rdx,%rdx
  40080c:	74 f4                	je     400802 <register_tm_clones+0x22>
  40080e:	5d                   	pop    %rbp
  40080f:	48 89 c6             	mov    %rax,%rsi
  400812:	bf 70 10 60 00       	mov    $0x601070,%edi
  400817:	ff e2                	jmpq   *%rdx
  400819:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400820 <__do_global_dtors_aux>:
  400820:	80 3d 51 08 20 00 00 	cmpb   $0x0,0x200851(%rip)        # 601078 <completed.6972>
  400827:	75 11                	jne    40083a <__do_global_dtors_aux+0x1a>
  400829:	55                   	push   %rbp
  40082a:	48 89 e5             	mov    %rsp,%rbp
  40082d:	e8 7e ff ff ff       	callq  4007b0 <deregister_tm_clones>
  400832:	5d                   	pop    %rbp
  400833:	c6 05 3e 08 20 00 01 	movb   $0x1,0x20083e(%rip)        # 601078 <completed.6972>
  40083a:	f3 c3                	repz retq 
  40083c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400840 <frame_dummy>:
  400840:	48 83 3d d8 05 20 00 	cmpq   $0x0,0x2005d8(%rip)        # 600e20 <__JCR_END__>
  400847:	00 
  400848:	74 1e                	je     400868 <frame_dummy+0x28>
  40084a:	b8 00 00 00 00       	mov    $0x0,%eax
  40084f:	48 85 c0             	test   %rax,%rax
  400852:	74 14                	je     400868 <frame_dummy+0x28>
  400854:	55                   	push   %rbp
  400855:	bf 20 0e 60 00       	mov    $0x600e20,%edi
  40085a:	48 89 e5             	mov    %rsp,%rbp
  40085d:	ff d0                	callq  *%rax
  40085f:	5d                   	pop    %rbp
  400860:	e9 7b ff ff ff       	jmpq   4007e0 <register_tm_clones>
  400865:	0f 1f 00             	nopl   (%rax)
  400868:	e9 73 ff ff ff       	jmpq   4007e0 <register_tm_clones>
  40086d:	0f 1f 00             	nopl   (%rax)

0000000000400870 <func1>:
int func1(int param)
{
  400870:	89 f8                	mov    %edi,%eax
    return param;
}
  400872:	c3                   	retq   
  400873:	66 66 66 66 2e 0f 1f 	data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
  40087a:	84 00 00 00 00 00 

0000000000400880 <func2>:

int func2(int param)
{
    return param - 1;
  400880:	8d 47 ff             	lea    -0x1(%rdi),%eax
}
  400883:	c3                   	retq   
  400884:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40088b:	00 00 00 
  40088e:	66 90                	xchg   %ax,%ax

0000000000400890 <__libc_csu_init>:
  400890:	41 57                	push   %r15
  400892:	41 89 ff             	mov    %edi,%r15d
  400895:	41 56                	push   %r14
  400897:	49 89 f6             	mov    %rsi,%r14
  40089a:	41 55                	push   %r13
  40089c:	49 89 d5             	mov    %rdx,%r13
  40089f:	41 54                	push   %r12
  4008a1:	4c 8d 25 68 05 20 00 	lea    0x200568(%rip),%r12        # 600e10 <__frame_dummy_init_array_entry>
  4008a8:	55                   	push   %rbp
  4008a9:	48 8d 2d 68 05 20 00 	lea    0x200568(%rip),%rbp        # 600e18 <__init_array_end>
  4008b0:	53                   	push   %rbx
  4008b1:	4c 29 e5             	sub    %r12,%rbp
  4008b4:	31 db                	xor    %ebx,%ebx
  4008b6:	48 c1 fd 03          	sar    $0x3,%rbp
  4008ba:	48 83 ec 08          	sub    $0x8,%rsp
  4008be:	e8 dd fc ff ff       	callq  4005a0 <_init>
  4008c3:	48 85 ed             	test   %rbp,%rbp
  4008c6:	74 1e                	je     4008e6 <__libc_csu_init+0x56>
  4008c8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  4008cf:	00 
  4008d0:	4c 89 ea             	mov    %r13,%rdx
  4008d3:	4c 89 f6             	mov    %r14,%rsi
  4008d6:	44 89 ff             	mov    %r15d,%edi
  4008d9:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  4008dd:	48 83 c3 01          	add    $0x1,%rbx
  4008e1:	48 39 eb             	cmp    %rbp,%rbx
  4008e4:	75 ea                	jne    4008d0 <__libc_csu_init+0x40>
  4008e6:	48 83 c4 08          	add    $0x8,%rsp
  4008ea:	5b                   	pop    %rbx
  4008eb:	5d                   	pop    %rbp
  4008ec:	41 5c                	pop    %r12
  4008ee:	41 5d                	pop    %r13
  4008f0:	41 5e                	pop    %r14
  4008f2:	41 5f                	pop    %r15
  4008f4:	c3                   	retq   
  4008f5:	66 66 2e 0f 1f 84 00 	data32 nopw %cs:0x0(%rax,%rax,1)
  4008fc:	00 00 00 00 

0000000000400900 <__libc_csu_fini>:
  400900:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000400904 <_fini>:
  400904:	48 83 ec 08          	sub    $0x8,%rsp
  400908:	48 83 c4 08          	add    $0x8,%rsp
  40090c:	c3                   	retq   
