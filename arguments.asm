    section .data
newline: db 0x0a, 0

    section .text
    global _start
_start:
    pop rcx
loop2:
    pop rsi
    push rcx
    call print_rsi
    mov rsi, newline
    call print_rsi
    pop rcx
    dec rcx
    cmp rcx, 0
    jne loop2

    mov rax, 60
    mov rdi, 0
    syscall

print_rsi:
    mov rax, 1
    mov rdx, 1
loop:
    syscall
    cmp byte [rsi], 0
    je end
    inc rsi
    jmp loop
end:
    ret
