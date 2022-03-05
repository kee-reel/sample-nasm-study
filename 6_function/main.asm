extern printf
section .data
    op_chars db "+-*/r"
    initial_num dq 13.0
    op_nums dq 0.37, 0.3, 10.0, 2.0
section .bss
    num resq 1
section .text
	global main
main:
push rbp
mov rbp, rsp
; Init num
    movsd xmm0, [initial_num]
    movsd [num], xmm0
; Add
    mov rax, op_chars+0
    mov rbx, num
    mov rcx, op_nums+0
    call addition
; Sub
    mov rax, op_chars+1
    mov rbx, num
    mov rcx, op_nums+8
    call substraction
; Mul
    mov rax, op_chars+2
    mov rbx, num
    mov rcx, op_nums+2*8
    call multiplication
; Div
    mov rax, op_chars+3
    mov rbx, num
    mov rcx, op_nums+3*8
    call division
; Sqrt
    mov rax, op_chars+4
    mov rbx, num
    call square_root
leave
ret

addition:
push rbp
mov rbp, rsp
    movsd xmm0, [rbx]
    movsd xmm1, [rcx]
    movsd xmm2, xmm0
    addsd xmm2, xmm1
    movsd [rbx], xmm2
    mov rbx, 3
    call print_res
leave
ret

substraction:
push rbp
mov rbp, rsp
    movsd xmm0, [rbx]
    movsd xmm1, [rcx]
    movsd xmm2, xmm0
    subsd xmm2, xmm1
    movsd [rbx], xmm2
    mov rbx, 3
    call print_res
leave
ret

multiplication:
push rbp
mov rbp, rsp
    movsd xmm0, [rbx]
    movsd xmm1, [rcx]
    movsd xmm2, xmm0
    mulsd xmm2, xmm1
    movsd [rbx], xmm2
    mov rbx, 3
    call print_res
leave
ret

division:
push rbp
mov rbp, rsp
    movsd xmm0, [rbx]
    movsd xmm1, [rcx]
    movsd xmm2, xmm0
    divsd xmm2, xmm1
    movsd [rbx], xmm2
    mov rbx, 3
    call print_res
leave
ret

square_root:
push rbp
mov rbp, rsp
    movsd xmm0, [rbx]
    sqrtsd xmm1, xmm0
    movsd [rbx], xmm2
    mov rbx, 2
    call print_res
leave
ret

print_res:
section .data
    binary_op_fmt db "%f %c %f = %f", 10, 0
    unary_op_fmt db "%c %f = %f", 10, 0
section .text
push rbp
mov rbp, rsp
    cmp rbx, 3
    je binary
unary:
    mov rdi, unary_op_fmt
    jmp print_res_continue
binary:
    mov rdi, binary_op_fmt
print_res_continue:
    mov rsi, [rax]
    mov rax, rbx
    call printf
leave
ret
