section .data

section .text
global _start

_start:
mov r9, 230	;y
mov r11, 20	;x
mov r14, 0

mov rcx, 1	; signo

cmp r11, 0
je x_zero
jg check_fix


x_neg:

cmp r9, 0
jge sum_pi

mov r14, -31
jmp check_fix

x_zero:
cmp r9, 0
jg sum_pi_h
jl res_pi_h

mov r9, 0
jmp done

sum_pi:
mov r14, 31
jmp check_fix

sum_pi_h:
mov r9, 1
jmp done

res_pi_h:
mov r9, -1
jmp done

check_fix:
cmp r9, r11
jl abs_x

mov rax, r9
mov r9, r11	; x <= y
mov r11, rax	; y <= x

cmp r9, 0
jl check_neg_y

cmp r11, 0
jl diff_sign

jmp same_sign

check_neg_y:
cmp r11, 0
jl same_sign
jmp diff_sign

same_sign:
mov rcx, -1	; signo
add r14, 15
jmp abs_x

diff_sign:
mov rcx, 1	; signo
add r14, -15


abs_x:
cmp r9, 0
jg abs_y

mov r8, -1
mov rax, r9
mul r8
mov r9, r8


abs_y:
cmp r11, 0
jg prearctan

mov r8, -1
mov rax, r11
mul r8
mov r11, r8

prearctan:

mov rax, r9
mov r9, 10
mul r9

div r11

mov r10, rax

mov r9, 7
cmp r10, 10
je correct_quadrant

mov r9, 0	; res
cmp r10, 0
je correct_quadrant

mov eax, 0
push rax	; count

mov rax, 1	; tempres

mov rbx, 1	; k
mov r11, 1	; x^2n
mov r12, 1
mov r13, 10

arctan:
mul r11
mul r10
div rbx
mov rdx, 0
mul rcx
add r9, rax

arctanaux:
pop rdx
add rdx, 1	; count ++

cmp rdx, 5
je correct_quadrant

mov rbx, rdx
push rdx

mov rax, 2
mul rbx
add rax, 1
mov rbx, rax	; 2(count)+1  (new k)

mov rax, rcx
mov rcx, -1
mul rcx
mov rcx, rax	; signo * -1

mov rax, r11
mul r10
mul r10
div r12

mov r11, rax	; x^2(n+1)

mov rax, r12
mul r13
mul r13
mul r13
mov r12, rax

mov rax, 1

jmp arctan

correct_quadrant:
add r9, r14
mov rax, r9
mov rdx, 0
cmp rax, 0
jl res_neg
mov rbx, 10
div rbx
mov r9, rax
jmp done

res_neg:
mov rcx, -1
mul rcx
xor rdx, rdx
mov rbx, 10
div rbx
mul rcx
mov r9, rax

rad_2_deg:
xor rdx, rdx
mov rbx, 3
mov rcx, 180
mov rax, r9
mul rcx
div rbx
mov r9, rax
cmp r9, 0
jg done

deg_neg:
mov rax, 180
add r9, rax

done:
mov rax, 60
mov rdi, 0
syscall
