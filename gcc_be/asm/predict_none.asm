
./a.out:     file format elf64-x86-64


Disassembly of section .init:

0000000000400570 <_init>:
  400570:	48 83 ec 08          	sub    $0x8,%rsp
  400574:	48 8b 05 7d 0a 20 00 	mov    0x200a7d(%rip),%rax        # 600ff8 <_DYNAMIC+0x1d0>
  40057b:	48 85 c0             	test   %rax,%rax
  40057e:	74 05                	je     400585 <_init+0x15>
  400580:	e8 5b 00 00 00       	callq  4005e0 <__gmon_start__@plt>
  400585:	48 83 c4 08          	add    $0x8,%rsp
  400589:	c3                   	retq   

Disassembly of section .plt:

0000000000400590 <printf@plt-0x10>:
  400590:	ff 35 72 0a 20 00    	pushq  0x200a72(%rip)        # 601008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400596:	ff 25 74 0a 20 00    	jmpq   *0x200a74(%rip)        # 601010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40059c:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004005a0 <printf@plt>:
  4005a0:	ff 25 72 0a 20 00    	jmpq   *0x200a72(%rip)        # 601018 <_GLOBAL_OFFSET_TABLE_+0x18>
  4005a6:	68 00 00 00 00       	pushq  $0x0
  4005ab:	e9 e0 ff ff ff       	jmpq   400590 <_init+0x20>

00000000004005b0 <memset@plt>:
  4005b0:	ff 25 6a 0a 20 00    	jmpq   *0x200a6a(%rip)        # 601020 <_GLOBAL_OFFSET_TABLE_+0x20>
  4005b6:	68 01 00 00 00       	pushq  $0x1
  4005bb:	e9 d0 ff ff ff       	jmpq   400590 <_init+0x20>

00000000004005c0 <__libc_start_main@plt>:
  4005c0:	ff 25 62 0a 20 00    	jmpq   *0x200a62(%rip)        # 601028 <_GLOBAL_OFFSET_TABLE_+0x28>
  4005c6:	68 02 00 00 00       	pushq  $0x2
  4005cb:	e9 c0 ff ff ff       	jmpq   400590 <_init+0x20>

00000000004005d0 <fprintf@plt>:
  4005d0:	ff 25 5a 0a 20 00    	jmpq   *0x200a5a(%rip)        # 601030 <_GLOBAL_OFFSET_TABLE_+0x30>
  4005d6:	68 03 00 00 00       	pushq  $0x3
  4005db:	e9 b0 ff ff ff       	jmpq   400590 <_init+0x20>

00000000004005e0 <__gmon_start__@plt>:
  4005e0:	ff 25 52 0a 20 00    	jmpq   *0x200a52(%rip)        # 601038 <_GLOBAL_OFFSET_TABLE_+0x38>
  4005e6:	68 04 00 00 00       	pushq  $0x4
  4005eb:	e9 a0 ff ff ff       	jmpq   400590 <_init+0x20>

00000000004005f0 <strtol@plt>:
  4005f0:	ff 25 4a 0a 20 00    	jmpq   *0x200a4a(%rip)        # 601040 <_GLOBAL_OFFSET_TABLE_+0x40>
  4005f6:	68 05 00 00 00       	pushq  $0x5
  4005fb:	e9 90 ff ff ff       	jmpq   400590 <_init+0x20>

0000000000400600 <malloc@plt>:
  400600:	ff 25 42 0a 20 00    	jmpq   *0x200a42(%rip)        # 601048 <_GLOBAL_OFFSET_TABLE_+0x48>
  400606:	68 06 00 00 00       	pushq  $0x6
  40060b:	e9 80 ff ff ff       	jmpq   400590 <_init+0x20>

0000000000400610 <exit@plt>:
  400610:	ff 25 3a 0a 20 00    	jmpq   *0x200a3a(%rip)        # 601050 <_GLOBAL_OFFSET_TABLE_+0x50>
  400616:	68 07 00 00 00       	pushq  $0x7
  40061b:	e9 70 ff ff ff       	jmpq   400590 <_init+0x20>

0000000000400620 <fwrite@plt>:
  400620:	ff 25 32 0a 20 00    	jmpq   *0x200a32(%rip)        # 601058 <_GLOBAL_OFFSET_TABLE_+0x58>
  400626:	68 08 00 00 00       	pushq  $0x8
  40062b:	e9 60 ff ff ff       	jmpq   400590 <_init+0x20>

Disassembly of section .text:

0000000000400630 <_start>:
  400630:	31 ed                	xor    %ebp,%ebp
  400632:	49 89 d1             	mov    %rdx,%r9
  400635:	5e                   	pop    %rsi
  400636:	48 89 e2             	mov    %rsp,%rdx
  400639:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  40063d:	50                   	push   %rax
  40063e:	54                   	push   %rsp
  40063f:	49 c7 c0 00 09 40 00 	mov    $0x400900,%r8
  400646:	48 c7 c1 90 08 40 00 	mov    $0x400890,%rcx
  40064d:	48 c7 c7 20 07 40 00 	mov    $0x400720,%rdi
  400654:	e8 67 ff ff ff       	callq  4005c0 <__libc_start_main@plt>
  400659:	f4                   	hlt    
  40065a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400660 <deregister_tm_clones>:
  400660:	b8 77 10 60 00       	mov    $0x601077,%eax
  400665:	55                   	push   %rbp
  400666:	48 2d 70 10 60 00    	sub    $0x601070,%rax
  40066c:	48 83 f8 0e          	cmp    $0xe,%rax
  400670:	48 89 e5             	mov    %rsp,%rbp
  400673:	77 02                	ja     400677 <deregister_tm_clones+0x17>
  400675:	5d                   	pop    %rbp
  400676:	c3                   	retq   
  400677:	b8 00 00 00 00       	mov    $0x0,%eax
  40067c:	48 85 c0             	test   %rax,%rax
  40067f:	74 f4                	je     400675 <deregister_tm_clones+0x15>
  400681:	5d                   	pop    %rbp
  400682:	bf 70 10 60 00       	mov    $0x601070,%edi
  400687:	ff e0                	jmpq   *%rax
  400689:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400690 <register_tm_clones>:
  400690:	b8 70 10 60 00       	mov    $0x601070,%eax
  400695:	55                   	push   %rbp
  400696:	48 2d 70 10 60 00    	sub    $0x601070,%rax
  40069c:	48 c1 f8 03          	sar    $0x3,%rax
  4006a0:	48 89 e5             	mov    %rsp,%rbp
  4006a3:	48 89 c2             	mov    %rax,%rdx
  4006a6:	48 c1 ea 3f          	shr    $0x3f,%rdx
  4006aa:	48 01 d0             	add    %rdx,%rax
  4006ad:	48 d1 f8             	sar    %rax
  4006b0:	75 02                	jne    4006b4 <register_tm_clones+0x24>
  4006b2:	5d                   	pop    %rbp
  4006b3:	c3                   	retq   
  4006b4:	ba 00 00 00 00       	mov    $0x0,%edx
  4006b9:	48 85 d2             	test   %rdx,%rdx
  4006bc:	74 f4                	je     4006b2 <register_tm_clones+0x22>
  4006be:	5d                   	pop    %rbp
  4006bf:	48 89 c6             	mov    %rax,%rsi
  4006c2:	bf 70 10 60 00       	mov    $0x601070,%edi
  4006c7:	ff e2                	jmpq   *%rdx
  4006c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000004006d0 <__do_global_dtors_aux>:
  4006d0:	80 3d a1 09 20 00 00 	cmpb   $0x0,0x2009a1(%rip)        # 601078 <completed.6972>
  4006d7:	75 11                	jne    4006ea <__do_global_dtors_aux+0x1a>
  4006d9:	55                   	push   %rbp
  4006da:	48 89 e5             	mov    %rsp,%rbp
  4006dd:	e8 7e ff ff ff       	callq  400660 <deregister_tm_clones>
  4006e2:	5d                   	pop    %rbp
  4006e3:	c6 05 8e 09 20 00 01 	movb   $0x1,0x20098e(%rip)        # 601078 <completed.6972>
  4006ea:	f3 c3                	repz retq 
  4006ec:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004006f0 <frame_dummy>:
  4006f0:	48 83 3d 28 07 20 00 	cmpq   $0x0,0x200728(%rip)        # 600e20 <__JCR_END__>
  4006f7:	00 
  4006f8:	74 1e                	je     400718 <frame_dummy+0x28>
  4006fa:	b8 00 00 00 00       	mov    $0x0,%eax
  4006ff:	48 85 c0             	test   %rax,%rax
  400702:	74 14                	je     400718 <frame_dummy+0x28>
  400704:	55                   	push   %rbp
  400705:	bf 20 0e 60 00       	mov    $0x600e20,%edi
  40070a:	48 89 e5             	mov    %rsp,%rbp
  40070d:	ff d0                	callq  *%rax
  40070f:	5d                   	pop    %rbp
  400710:	e9 7b ff ff ff       	jmpq   400690 <register_tm_clones>
  400715:	0f 1f 00             	nopl   (%rax)
  400718:	e9 73 ff ff ff       	jmpq   400690 <register_tm_clones>
  40071d:	0f 1f 00             	nopl   (%rax)

0000000000400720 <main>:

extern int func1(int param);
extern int func2(int param);

int main(int argc, char *argv[])
{
  400720:	55                   	push   %rbp
  400721:	41 57                	push   %r15
  400723:	41 56                	push   %r14
  400725:	41 55                	push   %r13
  400727:	41 54                	push   %r12
  400729:	53                   	push   %rbx
  40072a:	50                   	push   %rax
  40072b:	48 89 f3             	mov    %rsi,%rbx
  40072e:	83 ff 03             	cmp    $0x3,%edi
    int fill;
    int size;
    int result = 0;
    char *buffer = NULL;

    if (argc != 3) {
  400731:	0f 85 e6 00 00 00    	jne    40081d <main+0xfd>
        fprintf(stderr, "Usage: %s fill_value buffer_size\n", argv[0]);
        exit(EXIT_FAILURE);
    }
    
    fill = atoi(argv[1]);
  400737:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
  40073b:	45 31 ed             	xor    %r13d,%r13d
  40073e:	31 f6                	xor    %esi,%esi
  400740:	ba 0a 00 00 00       	mov    $0xa,%edx
#ifdef __USE_EXTERN_INLINES
__BEGIN_NAMESPACE_STD
__extern_inline int
__NTH (atoi (const char *__nptr))
{
  return (int) strtol (__nptr, (char **) NULL, 10);
  400745:	e8 a6 fe ff ff       	callq  4005f0 <strtol@plt>
  40074a:	49 89 c6             	mov    %rax,%r14
    size = atoi(argv[2]);
  40074d:	48 8b 7b 10          	mov    0x10(%rbx),%rdi
  400751:	31 f6                	xor    %esi,%esi
  400753:	ba 0a 00 00 00       	mov    $0xa,%edx
  400758:	e8 93 fe ff ff       	callq  4005f0 <strtol@plt>
  40075d:	49 89 c7             	mov    %rax,%r15
    
    buffer = (char*)malloc(size * sizeof(*buffer));
  400760:	49 63 df             	movslq %r15d,%rbx
  400763:	48 89 df             	mov    %rbx,%rdi
  400766:	e8 95 fe ff ff       	callq  400600 <malloc@plt>
  40076b:	49 89 c4             	mov    %rax,%r12
  40076e:	4d 85 e4             	test   %r12,%r12
    if (buffer == NULL) {
  400771:	0f 84 c9 00 00 00    	je     400840 <main+0x120>
        fprintf(stderr, "calloc() failed");
        exit(EXIT_FAILURE);
    }

    memset(buffer, fill, size * sizeof(*buffer));
  400777:	41 0f b6 f6          	movzbl %r14b,%esi
  40077b:	4c 89 e7             	mov    %r12,%rdi
  40077e:	48 89 da             	mov    %rbx,%rdx
  400781:	e8 2a fe ff ff       	callq  4005b0 <memset@plt>
    
    for (i = 0; i < RUN_CNT; i++) {
        for (j = 0; j < size; j++) {
  400786:	85 db                	test   %ebx,%ebx
  400788:	7e 44                	jle    4007ce <main+0xae>
  40078a:	31 ed                	xor    %ebp,%ebp
  40078c:	31 db                	xor    %ebx,%ebx
  40078e:	eb 10                	jmp    4007a0 <main+0x80>
  400790:	31 db                	xor    %ebx,%ebx
  400792:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
  400799:	1f 84 00 00 00 00 00 
#ifdef EXPECTED_VALUE
            if (__builtin_expect(buffer[j], EXPECTED_VALUE)) {
#else
            if (buffer[j]) {
  4007a0:	41 80 3c 1c 00       	cmpb   $0x0,(%r12,%rbx,1)
  4007a5:	75 09                	jne    4007b0 <main+0x90>
#endif
                result += func1(j);
            } else {
                result += func2(j);
  4007a7:	89 df                	mov    %ebx,%edi
  4007a9:	e8 d2 00 00 00       	callq  400880 <func2>
  4007ae:	eb 07                	jmp    4007b7 <main+0x97>
#ifdef EXPECTED_VALUE
            if (__builtin_expect(buffer[j], EXPECTED_VALUE)) {
#else
            if (buffer[j]) {
#endif
                result += func1(j);
  4007b0:	89 df                	mov    %ebx,%edi
  4007b2:	e8 b9 00 00 00       	callq  400870 <func1>
  4007b7:	41 01 c5             	add    %eax,%r13d
    }

    memset(buffer, fill, size * sizeof(*buffer));
    
    for (i = 0; i < RUN_CNT; i++) {
        for (j = 0; j < size; j++) {
  4007ba:	48 ff c3             	inc    %rbx
  4007bd:	41 39 df             	cmp    %ebx,%r15d
  4007c0:	75 de                	jne    4007a0 <main+0x80>
        exit(EXIT_FAILURE);
    }

    memset(buffer, fill, size * sizeof(*buffer));
    
    for (i = 0; i < RUN_CNT; i++) {
  4007c2:	ff c5                	inc    %ebp
  4007c4:	81 fd 10 27 00 00    	cmp    $0x2710,%ebp
  4007ca:	75 c4                	jne    400790 <main+0x70>
  4007cc:	eb 29                	jmp    4007f7 <main+0xd7>
  4007ce:	b8 00 27 00 00       	mov    $0x2700,%eax
  4007d3:	66 66 66 66 2e 0f 1f 	data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
  4007da:	84 00 00 00 00 00 
  4007e0:	83 c0 e0             	add    $0xffffffe0,%eax
  4007e3:	75 fb                	jne    4007e0 <main+0xc0>
  4007e5:	b8 10 00 00 00       	mov    $0x10,%eax
  4007ea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  4007f0:	45 31 ed             	xor    %r13d,%r13d
  4007f3:	ff c8                	dec    %eax
  4007f5:	75 f9                	jne    4007f0 <main+0xd0>
                result += func2(j);
            }
        }
    }

    printf("Result: %d (size: %d, fill: %d)\n", result, size, fill);
  4007f7:	bf 46 09 40 00       	mov    $0x400946,%edi
  4007fc:	31 c0                	xor    %eax,%eax
  4007fe:	44 89 ee             	mov    %r13d,%esi
  400801:	44 89 fa             	mov    %r15d,%edx
  400804:	44 89 f1             	mov    %r14d,%ecx
  400807:	e8 94 fd ff ff       	callq  4005a0 <printf@plt>
  40080c:	31 c0                	xor    %eax,%eax

    return 0;
  40080e:	48 83 c4 08          	add    $0x8,%rsp
  400812:	5b                   	pop    %rbx
  400813:	41 5c                	pop    %r12
  400815:	41 5d                	pop    %r13
  400817:	41 5e                	pop    %r14
  400819:	41 5f                	pop    %r15
  40081b:	5d                   	pop    %rbp
  40081c:	c3                   	retq   
    int size;
    int result = 0;
    char *buffer = NULL;

    if (argc != 3) {
        fprintf(stderr, "Usage: %s fill_value buffer_size\n", argv[0]);
  40081d:	48 8b 0d 4c 08 20 00 	mov    0x20084c(%rip),%rcx        # 601070 <__TMC_END__>
  400824:	48 8b 13             	mov    (%rbx),%rdx
  400827:	be 14 09 40 00       	mov    $0x400914,%esi
  40082c:	31 c0                	xor    %eax,%eax
  40082e:	48 89 cf             	mov    %rcx,%rdi
  400831:	e8 9a fd ff ff       	callq  4005d0 <fprintf@plt>
  400836:	bf 01 00 00 00       	mov    $0x1,%edi
        exit(EXIT_FAILURE);
  40083b:	e8 d0 fd ff ff       	callq  400610 <exit@plt>
    fill = atoi(argv[1]);
    size = atoi(argv[2]);
    
    buffer = (char*)malloc(size * sizeof(*buffer));
    if (buffer == NULL) {
        fprintf(stderr, "calloc() failed");
  400840:	48 8b 05 29 08 20 00 	mov    0x200829(%rip),%rax        # 601070 <__TMC_END__>
  400847:	bf 36 09 40 00       	mov    $0x400936,%edi
  40084c:	be 0f 00 00 00       	mov    $0xf,%esi
  400851:	ba 01 00 00 00       	mov    $0x1,%edx
  400856:	48 89 c1             	mov    %rax,%rcx
  400859:	e8 c2 fd ff ff       	callq  400620 <fwrite@plt>
  40085e:	bf 01 00 00 00       	mov    $0x1,%edi
        exit(EXIT_FAILURE);
  400863:	e8 a8 fd ff ff       	callq  400610 <exit@plt>
  400868:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40086f:	00 

0000000000400870 <func1>:
int func1(int param)
{
    return param;
  400870:	89 f8                	mov    %edi,%eax
  400872:	c3                   	retq   
  400873:	66 66 66 66 2e 0f 1f 	data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
  40087a:	84 00 00 00 00 00 

0000000000400880 <func2>:
}

int func2(int param)
{
    return param - 1;
  400880:	8d 47 ff             	lea    -0x1(%rdi),%eax
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
  4008be:	e8 ad fc ff ff       	callq  400570 <_init>
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
