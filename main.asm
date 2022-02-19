extern printf
section .data
	msg_fmt db "Message: %d", 10, 0
	msg db "Hello world!", 0
	msg_len db $-msg-1
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

	;mov rax, 1	; write
	;mov rdi, 1	; to stdout
	;mov rsi, msg	; set msg
	;mov rdx, msg_len	; msg len
	;syscall

	;mov rax, 60	; exit
	;mov rdi, 1	; exit code
	;syscall

    ret
