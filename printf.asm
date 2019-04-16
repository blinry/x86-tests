    extern printf

    segment .text
    global _start
_start:

    mov rbx, message
    call printf

    mov rax, 60
    mov rdi, 0
    syscall

    section .rodata
message:
    db "Hello RC!", 0
