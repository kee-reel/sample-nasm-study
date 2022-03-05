extern printf
section .data
	msg_fmt db "Message: %d", 10, 0
    value dd 1337
section .bss
section .text
	global main
main:
    push rbp
    mov rbp, rsp

    mov rdi, msg_fmt
    mov rsi, [value]
    mov rax, 0
    call printf

    mov rsp, rbp
    pop rbp

    ret
