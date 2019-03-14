SYSEXIT = 1
SYSREAD = 3
SYSWRITE = 4
STDOUT = 1
STDIN = 0
EXIT_SUCCESS = 0
BUF_SIZE = 80
.align 32

.data


buf: .space BUF_SIZE

.text



.global _start  

_start:
    mov $SYSREAD, %eax
    mov $STDIN, %ebx
    mov $buf, %ecx
    mov $BUF_SIZE, %edx

    int $0x80

    mov %eax, %edi

    mov $SYSWRITE, %eax
    mov $STDOUT, %ebx
    mov $buf, %ecx
    mov %edi, %edx

    int $0x80

    mov $SYSEXIT, %eax
    mov $EXIT_SUCCESS, %ebx
    int $0x80
