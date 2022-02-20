extern printf
section .data
    old_msg_fmt db "Old string: %s", 10, 0
    new_msg_fmt db "New string: %s", 10, 0
	rev_str db "Test string", 0
    rev_str_len db $-rev_str-1
section .bss
section .text
	global main
main:
    push rbp
    mov rbp, rsp

; Print string
    mov rdi, old_msg_fmt
    mov rsi, rev_str
    mov rax, 0
    call printf

; Push string to stack from memory
    xor rax, rax
    mov rbx, rev_str
    mov rcx, [rev_str_len]
    mov r12, 0
push_loop:
    mov al, byte [rbx+r12]
    push rax
    inc r12
    loop push_loop

; Pop string from stack to memory
    mov rbx, rev_str
    mov rcx, [rev_str_len]
    mov r12, 0
pop_loop:
    pop rax
    mov byte [rbx+r12], al
    inc r12
    loop pop_loop

; Upper first letter case
    sub byte [rbx], 32
; Lower last letter case
    add byte [rbx+r12-1], 32

; Print string
    mov rdi, new_msg_fmt
    mov rsi, rev_str
    mov rax, 0
    call printf

    mov rsp, rbp
    pop rbp

    ret
