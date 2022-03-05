extern printf
section .data
	msg_fmt db "Sum: %d", 10, 0
    n dd 10
section .bss
section .text
	global main
main:
    push rbp
    mov rbp, rsp

    mov rbx, 0
    mov rax, 0

jloop:
    add rax, rbx
    inc rbx
    cmp rbx, [n]
    jle jloop

    mov rdi, msg_fmt
    mov rsi, rax
    mov rax, 0
    call printf

    mov rsp, rbp
    pop rbp

    ret
