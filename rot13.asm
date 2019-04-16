    section .bss
buf: resb 1

    section .text
    global _start
_start: ; entry point
    call read_byte
    call mod_byte
    call print_byte
    jmp _start
read_byte: ; read one byte from stdin
    mov rax, 0
    mov rdi, 0
    mov rsi, buf
    mov rdx, 1
    syscall
    cmp rax, 0 ; if we didn't get a byte, quit
    je quit
    ret
mod_byte:
    mov rax, [buf]
uppercase_test: ; is this an uppercase character?
    cmp rax, 65 ; 'A'
    jl continue
    cmp rax, 90 ; 'Z'
    jg lowercase_test ; test for lowercase character
    jmp uppercase
lowercase_test: ; is this a lowercase character?
    cmp rax, 97 ; 'a'
    jl continue
    cmp rax, 122 ; 'z'
    jg continue
    jmp lowercase
uppercase:
    cmp rax, 77
    jle addd
    jmp subtract
lowercase:
    cmp rax, 109
    jle addd
    jmp subtract
subtract:
    sub rax, 13
    jmp continue
addd:
    add rax, 13
    jmp continue
continue:
    mov [buf], rax
    ret
print_byte:
    mov rax, 1
    mov rdi, 1
    mov rsi, buf
    mov rdx, 1
    syscall
    ret
quit:
    mov rax, 60
    mov rdi, 0
    syscall
