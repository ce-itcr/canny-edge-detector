section .bss
	arr1 times 90000 resb 0
	res times 90000 resb 0

section .text
global _start

_start:
mov r8, -1	;i
mov r11, 300
mov r12, 0		; img_max


loop_i:
inc r8
cmp r8, 299
jg done

mov r10, -1	;j

loop_j:
mov rbx, 255		; q
mov rcx, 255		; r
inc r10
cmp r10, 299
jg loop_i

cmp r8, 0
je res_zero

cmp r8, 299
je res_zero

cmp r10, 0
je res_zero

cmp r10, 299
je res_zero

mov rax, 300
mul r10

inc r8
mov rdx, rax
mov rax, 0

mov al, byte [arr1 + rdx]

cmp rax, 22
jl l22_or_g157

cmp rax, 67
jl l67

cmp rax, 112
jl l122

cmp rax, 157
jl l157

jmp l22_or_g157


l22_or_g157:
mov bl, byte [arr1 + rdx + 300]
mov cl, byte [arr1 + rdx - 300]
jmp compare_img

l67:
mov bl, byte [arr1 + rdx - 299]
mov cl, byte [arr1 + rdx + 299]
jmp compare_img

l122:
mov bl, byte [arr1 + rdx + 1]
mov cl, byte [arr1 + rdx - 1]
jmp compare_img

l157:
mov bl, byte [arr1 + rdx - 301]
mov cl, byte [arr1 + rdx + 301]

compare_img:
cmp al, bl
jl res_zero

cmp al, cl
jl res_zero

mov byte [res + rdx], al

cmp rax, r12
jl loop_j

mov r12, rax

jmp loop_j

res_zero:
mov rax, 300
mul r10

inc r8
mov rdx, rax
mov al, 0

mov byte [res + rdx], al

threshold:
mov rax, r12
mov r8, 100
mov r9, 9
mov r10, 5
mul r8
mul r9
div r8
mov rcx, rax		;high

mul r8
mul r10
div r8
mov rbx, rax		;low
mov rdx, -1

threshold_loop:
inc rdx

cmp rdx, 89999
jg done


mov al, byte [res + rdx]

cmp al, cl
jge strong

cmp al, bl
jl threshold_loop

weak:
mov al, 25 
mov byte [res + rdx], al
jmp threshold_loop

strong:
mov al, 255 
mov byte [res + rdx], al
jmp threshold_loop

done:
mov rax, 60
mov rdi, 0
syscall
