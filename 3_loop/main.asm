extern printf
section .data
	msg_fmt db "Sum: %d", 10, 0
    n dd 10
section .bss
    bvar resb 1
section .text
	global main
main:
    push rbp
    mov rbp, rsp

    mov rcx, [n]    ; rcx - counter register
    mov rax, 0      ; rax - accumulator register

bloop:
    add rax, rcx
    loop bloop  ; slower than jump loop

    mov rdi, msg_fmt
    mov rsi, rax
    mov rax, 0
    call printf

    mov rsp, rbp
    pop rbp

    ret
