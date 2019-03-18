.data
STDIN = 0
STDOUT = 1
SYSREAD = 3
SYSWRITE = 4
SYSEXIT = 1
EXIT_SUCCESS = 0
BUFLEN = 512


.bss
.comm textin, 512
.comm textout, 512

.text
.globl _start

_start:
movl $SYSREAD, %eax
movl $STDIN, %ebx
movl $textin, %ecx
movl $BUFLEN, %edx
int $0x80

movl %eax, %edi
movl $0, %ebx

jmp petla

petla:

movb textin(,%ebx,1), %al
xor $0x20, %al
movb %al, textout(, %ebx,1)


inc %ebx
cmp %edi, %ebx
jle petla
jmp wyswietl

wyswietl:
movl $SYSWRITE, %eax
movl $STDOUT, %ebx
movl $textout, %ecx
movl %edi, %edx
int $0x80

mov $SYSEXIT, %eax
mov $EXIT_SUCCESS, %ebx
int $0x80
