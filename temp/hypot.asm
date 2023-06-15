section .text
global _start

_start:

mov r8, 42	; a
mov r9, 22	; b
mov r10, 100

mov rax, r8
mul r10
mov r8, rax

mov rax, r9
mul r10
mov r9, rax

mov rax, 1
mul r8
mul r8
mov rbx, rax

mov rax, 1
mul r9
mul r9
add rbx, rax
mov r12, rbx

mov r10, r12	; r
mov r11, 0	; t

hypot:
cmp r10, r11
je done

mov r11, r10

xor rdx, rdx
mov ebx, 2
mov rax, r12
div r10
add rax, r10
xor rdx, rdx
div ebx
mov r10, rax

jmp hypot


done:
xor rdx, rdx
mov rax, r11
mov r10, 100
div r10 

mov rax, 60
mov rdi, 0
syscall
