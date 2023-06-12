section .bss
	arr1 times 90000 resb 0
	res times 90000 resb 0
	res_final times 90000 resb 0

section .text
global _start

_start:
mov r8, -1	;i
mov r11, 300
mov r12, 0		; img_max


loop_i:
inc r8
cmp r8, 299
jg threshold

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
add rax, r8

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

hysteresis:
mov r8, -1
mov r11, 300

loop_i:
inc r8
cmp r8, 299
jg done

mov r10, -1

loop_j:
inc r10

cmp r10, 299
jg loop_i

mov rax, 300
mul r10
add rax, r8

mov rdx, rax
mov rax, 0

mov al, byte [res + rdx]

cmp al, 25
jne loop_j


is_in_border:

cmp r8, 0
je val_zero

cmp r8, 299
je val_zero

cmp r10, 0
je val_zero

cmp r10, 299
je val_zero

is_strong:

mov bl, byte [res + rdx - 299]
mov bh, byte [res + rdx + 1]
mov cl, byte [res + rdx + 301]
mov ch, byte [res + rdx - 300]

cmp bl, 255
je val_255

cmp bh, 255
je val_255

cmp cl, 255
je val_255

cmp ch, 255
je val_255

mov bl, byte [res + rdx + 300]
mov bh, byte [res + rdx - 301]
mov cl, byte [res + rdx - 1]
mov ch, byte [res + rdx + 299]

cmp bl, 255
je val_255

cmp bh, 255
je val_255

cmp cl, 255
je val_255

cmp ch, 255
je val_255

jmp val_zero

val_255:
mov al, 255
mov byte [res + rdx], al
jmp loop_j

val_zero:
mov al, 0
mov byte [res + rdx], al
jmp loop_j

done:
mov rax, 60
mov rdi, 0
syscall
