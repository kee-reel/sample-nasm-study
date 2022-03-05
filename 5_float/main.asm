extern printf
section .data
    op_fmt db "%f %c %f = %f", 10, 0
    bin_op_fmt db "%c %f = %f", 10, 0
    add_char db '+'
    sub_char db "-"
    mul_char db "*"
    div_char db "/"
    sqrt_char db "r"
    num_init dq 13.0
    add_num dq 0.37
    sub_num dq 0.3
    mul_num dq 10.0
    div_num dq 2.0
section .bss
    num resq 1
section .text
	global main
main:
    push rbp
    mov rbp, rsp

; Init num
    movsd xmm0, [num_init]
    movsd [num], xmm0
; Add
    movsd xmm0, [num]
    movsd xmm1, [add_num]
    movsd xmm2, xmm0
    addsd xmm2, xmm1
    movsd [num], xmm2
; Print string
    mov rdi, op_fmt
    mov rsi, [add_char]
    mov rax, 3
    call printf
; Sub
    movsd xmm0, [num]
    movsd xmm1, [sub_num]
    movsd xmm2, xmm0
    subsd xmm2, xmm1
    movsd [num], xmm2
; Print string
    mov rdi, op_fmt
    mov rsi, [sub_char]
    mov rax, 3
    call printf
; Mul
    movsd xmm0, [num]
    movsd xmm1, [mul_num]
    movsd xmm2, xmm0
    mulsd xmm2, xmm1
    movsd [num], xmm2
; Print string
    mov rdi, op_fmt
    mov rsi, [mul_char]
    mov rax, 3
    call printf
; Div
    movsd xmm0, [num]
    movsd xmm1, [div_num]
    movsd xmm2, xmm0
    divsd xmm2, xmm1
    movsd [num], xmm2
; Print string
    mov rdi, op_fmt
    mov rsi, [div_char]
    mov rax, 3
    call printf
; Sqrt
    movsd xmm0, [num]
    sqrtsd xmm1, xmm0
    movsd [num], xmm1
; Print string
    mov rdi, bin_op_fmt
    mov rsi, [sqrt_char]
    mov rax, 1
    call printf

    mov rsp, rbp
    pop rbp

    ret
