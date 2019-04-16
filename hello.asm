    section .text
    global _start
_start:
    mov eax, 1
    mov edi, 1
    mov esi, msg
    mov edx, 12
    syscall

    mov eax, 60
    mov edi, 0
    syscall

    section .rodata
msg: db "Hello World", 10
