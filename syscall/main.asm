extern printf
section .data
	msg db "Message", 10
	msg_len db $-msg
section .bss
section .text
	global main
main:
    push rbp
    mov rbp, rsp

    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, [msg_len]
    syscall

    mov rsp, rbp
    pop rbp

    ret
