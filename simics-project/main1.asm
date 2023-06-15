	; ==========================================================================================================================================
	; SCRIPT NAME: main.asm
	;
	; PURPOSE: x86 implementation of the Canny Edge Detection filter to an image.
	; DESCRIPTION: The general objective of the project is to apply the Canny Edge Detection filter to a grayscale image using an assembler
	; application for the x86 architecture, in order to compare the performance and the improvement obtained when running it
	; on an architecture with a dynamic scheduler by hardware and without it, using SIMICS as a simulation tool.
	;
	; REVISION HISTORY:
	;
	; AUTHOR DATE DETAILS
	; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	; @angelortizv 2023 - 06 - 07 Setup Project
	; @jesquivel48 2023 - 06 - 13 Functional Version
	;
	; REFERENCES: https: / / docs.opencv.org / 3.4 / da / d22 / tutorial_py_canny.html
	; https: / / www.figma.com / file / PWF7Q8PaHphNb9abrvelKh / canny - edge - detector?type=design&node - id=0%3A1&t=h3NEP3Ev4Rq62z4z - 1
	;
	; ==========================================================================================================================================
	
	section .data
	filename db "result_x.txt", 0
	newfilename db "res.txt", 0
	buffersize equ 10
	nfbuffersize equ 1
	arr1 times 90000 db 0
	angle times 90000 db 0
	res times 90000 db 0
	
	section .bss
	buffer resb buffersize
	nfbuffer resb nfbuffersize
	
	section .text
	global _start
	
_start:

	mov rax, 2		;SYS_OPEN
	mov rdi, newfilename
	mov rsi, 64		;create
	mov rdx, 0666o
	syscall

	mov rax, 3
	mov rdi, rbx
	syscall
	
	mov rax, 0                   ; count
	push rax
	mov rax, 0                   ; current num in file
	push rax
	
readfile:
	mov rax, 2                   ;SYS_OPEN
	mov rdi, filename
	mov rsi, 0                   ;read only
	mov rdx, 0666o
	syscall
	
	mov rbx, rax
	pop r8
	
	mov rax, rbx
	mov rdi, rax
	mov rax, 8
	mov rsi, r8                  ; Comenzar a leer en el byte r8
	mov rdx, 0
	syscall
	
	mov rax, rbx
	mov rdi, rax
	mov rax, 0                   ;SYS_READ
	mov rsi, buffer              ; Guarda el resultado en buffer
	mov rdx, buffersize
	syscall
	
	mov rax, 3
	mov rdi, rbx                 ; Cierra el archivo
	syscall
	
	jmp getbyte
	
	
getbyte:                      ; Se resetean los registros utilizados para obtner los dos bytes
	mov rcx, 0                   ;cl init and ch numcount
	mov rdx, 0                   ;buffcount
	mov r11, 0
	
spacebyte:
	mov bl, [buffer + rdx]
	inc ch
	inc rdx
	
	cmp bl, 32                   ; ascii 32 es el espacio, arriba de eso son los numeros
	jg spacebyte
	push rdx
	
	dec ch
	mov bh, ch
	add bh, cl
	mov rdx, 0
	push rcx
	mov ch, 0
	mov rdx, rcx                 ; Inicia dl en el valor donde comienza el numero
	pop rcx
	mov r9, 1
	
str2int:                      ; Bucle para convertir el ascii del numero obtenido en el numero en si
	mov bl, 1
	mov ax, 1
	mov r10, 10
	
	push rdx
	call pow_10                  ; Se eleva 10 a la n (tamano)
	pop rdx
	
	dec ch
	
	mov al, [buffer + rdx]
	
	cmp al, 45
	je num_neg
	
	sub al, 48                   ; Para obtener el numero se resta 48 al resultado del ascii (48 es el valor del ascii 0)
	
	push rdx
	mul r10
	pop rdx
	add r11, rax                 ; Se multiplica el valor por 10 a la n y se suma al resultado total en r11 (numero temporal)
	
	inc rdx
	
	cmp dl, bh
	jl str2int                   ; Bucle hasta hacer eso con el numero completo de un byte
	
	pop rdx
	add r8, rdx                  ; r8 ahora tiene el nuevo valor para comenzar a leer al final del segundo byte
	push r8
	
	mov rax, r11
	mul r9
	mov r13, rax
	mov r8, r13                  ; a hypot
	mov r9, r13                  ; b hypot
	jmp abs_x_hypot
	
num_neg:
	mov r9, - 1                  ; Para obtener el numero se resta 48 al resultado del ascii (48 es el valor del ascii 0)
	
	inc rdx
	
	jmp str2int                  ; Bucle hasta hacer eso con el numero completo de un byte
	
	
abs_x_hypot: 
	cmp r8, 0 
	jg prehypot 
 
	mov cx, - 1 
	mov rax, r8 
	mul cx 
	mov r8, rax 
	mov r9, rax
	
	
prehypot:
	
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
	
	mov r10, r12                 ; r
	mov r11, 0                   ; t
	
hypot:
	cmp r10, r11
	je done_hypot
	
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
	
	
	
done_hypot:                   ; modificar done para loop y G.max()
	xor rdx, rdx
	mov rax, r11
	mov r10, 100
	div r10
	pop rbx
	pop rdx
	mov byte [arr1 + rdx], al
	push rdx
	push rbx
	
	
arctan2:
	mov r9, r13                  ;y
	mov r11, r13                 ;x
	mov r14, 0
	
	mov rcx, 1                   ; signo
	
	cmp r11, 0
	je x_zero
	jg check_fix
	
	
x_neg:
	cmp r9, 0
	jge sum_pi
	
	mov r14, - 31
	jmp check_fix
	
x_zero:
	cmp r9, 0
	jg sum_pi_h
	jl res_pi_h
	
	mov r9, 0
	jmp rad_2_deg
	
sum_pi:
	mov r14, 31
	jmp check_fix
	
sum_pi_h:
	mov r9, 1
	jmp rad_2_deg
	
res_pi_h:
	mov r9, - 1
	jmp rad_2_deg
	
check_fix:
	cmp r9, r11
	jl abs_x
	
	mov rax, r9
	mov r9, r11                  ; x <= y
	mov r11, rax                 ; y <= x
	
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
	mov rcx, - 1                 ; signo
	add r14, 15
	jmp abs_x
	
diff_sign:
	mov rcx, 1                   ; signo
	add r14, - 15
	
abs_x:
	cmp r9, 0
	jg abs_y
	
	mov r8, - 1
	mov rax, r9
	mul r8
	mov r9, rax
	
abs_y:
	cmp r11, 0
	jg prearctan
	
	mov r8, - 1
	mov rax, r11
	mul r8
	mov r11, rax
	
prearctan:
	mov rax, r9
	mov r9, 10
	mul r9
	
	div r11
	
	mov r10, rax
	
	mov r9, 7
	cmp r10, 10
	je correct_quadrant
	
	mov r9, 0                    ; res
	cmp r10, 0
	je correct_quadrant
	
	mov eax, 0
	push rax                     ; count
	
	mov rax, 1                   ; tempres
	
	mov rbx, 1                   ; k
	mov r11, 1                   ; x^2n
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
	add rdx, 1                   ; count + + 
	
	cmp rdx, 5
	je correct_quadrant
	
	mov rbx, rdx
	push rdx
	
	mov rax, 2
	mul rbx
	add rax, 1
	mov rbx, rax                 ; 2(count) + 1 (new k)
	
	mov rax, rcx
	mov rcx, - 1
	mul rcx
	mov rcx, rax                 ; signo * - 1
	
	mov rax, r11
	mul r10
	mul r10
	div r12
	
	mov r11, rax                 ; x^2(n + 1)
	
	mov rax, r12
	mul r13
	mul r13
	mul r13
	mov r12, rax
	
	mov rax, 1
	
	jmp arctan
	
correct_quadrant:
	mov rax, r9
	mul rcx
	mov r9, rax
	add r9, r14
	mov rax, r9
	mov rdx, 0
	cmp rax, 0
	jl res_neg
	mov rbx, 10
	div rbx
	mov r9, rax
	jmp rad_2_deg
	
res_neg:
	mov rcx, - 1
	mul rcx
	xor rdx, rdx
	mov rbx, 10
	div rbx
	mul rcx
	mov r9, rax
	
rad_2_deg:
	cmp r9, 0
	jl deg_neg
	
	xor rdx, rdx
	mov rbx, 3
	mov rcx, 180
	mov rax, r9
	mul rcx
	div rbx
	mov r9, rax
	cmp r9, 0
	jge done_arctan
	
deg_neg:
	mov rax, r9
	mov rcx, - 1
	mul rcx
	mov r9, rax
	
	xor rdx, rdx
	mov rbx, 3
	mov rcx, 180
	mov rax, r9
	mul rcx
	div rbx
	
	mov rbx, - 1
	mul rbx
	add rax, rcx
	
	mov r9, rax
	cmp r9, 0
	
done_arctan:                  ; Modificar done arctan
	mov rax, r9
	pop rbx
	pop rdx
	mov byte [angle + rdx], al
	inc rdx
	
	cmp rdx, 89999
	je suppression
	
	push rdx
	push rbx
	jmp readfile
	
suppression:
	mov r8, - 1                  ;i
	mov r11, 300
	mov r12, 0                   ; img_max
	
loop_i:
	inc r8
	cmp r8, 299
	jg threshold
	
	mov r10, - 1                 ;j
	
loop_j:
	mov rbx, 255                 ; q
	mov rcx, 255                 ; r
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
	mul r8
	add rax, r10
	
	mov rdx, rax
	mov rax, 0
	
	mov al, byte [angle + rdx]
	
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
	mov bl, byte [arr1 + rdx + 1]
	mov cl, byte [arr1 + rdx - 1]
	jmp compare_img
	
l67:
	mov bl, byte [arr1 + rdx + 299]
	mov cl, byte [arr1 + rdx - 299]
	jmp compare_img
	
l122:
	mov bl, byte [arr1 + rdx + 300]
	mov cl, byte [arr1 + rdx - 300]
	jmp compare_img
	
l157:
	mov bl, byte [arr1 + rdx - 301]
	mov cl, byte [arr1 + rdx + 301]
	
compare_img:
	mov al, byte [arr1 + rdx]
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
	mul r8
	
	add rax, r10
	mov rdx, rax
	mov al, 0
	
	mov byte [res + rdx], al
	jmp loop_j
	
threshold:
	mov rax, 255
	mov r8, 100
	mov r9, 9
	mov r10, 5
	mul r9
	div r8
	mov rcx, rax                 ;high
	
	mul r10
	div r8
	mov rbx, rax                 ;low
	mov rdx, - 1
	
threshold_loop:
	inc rdx
	
	cmp rdx, 89999
	jg hysteresis
	
	
	mov al, byte [res + rdx]
	
	cmp al, cl
	jg strong
	
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
	mov r8, - 1
	mov r11, 300
	
loop_i_hyst:
	inc r8
	cmp r8, 299
	jg done
	
	mov r10, - 1
	
loop_j_hyst:
	inc r10
	
	cmp r10, 299
	jg loop_i_hyst
	
	mov rax, 300
	mul r8
	add rax, r10
	
	mov rdx, rax
	mov rax, 0
	
	mov al, byte [res + rdx]
	
	cmp al, 25
	jne val_zero
	
	
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
	mov r13, 2
	mov r12, 3
	mov rbx, 100
	mov al, 5
	push ax
	mov al, 5
	push ax
	mov al, 2
	push ax
	
	jmp valzero
	
val_zero:
	mov r13, 2
	mov r12, 1
	mov rbx, 1
	mov al, 0
	push ax
	
valzero:                      ; Bucle para escribir el ascii en el archivo desencriptado
	pop ax
	
	cmp r12, 1                   ; Caso del ultimo digito
	je lastdig
	
	dec r12
	
	jmp assignascii
	
lastdig:                      ; Bandera para agregar un espacio despues del numero
	mov r13, 1
	
assignascii:                  ; Agrega 48 al valor del digito (Valor del ascii 0)
	add al, 48
	mov [nfbuffer], al
	
	
writefile:
	mov rax, 2                   ;SYS_OPEN
	mov rdi, newfilename
	mov rsi, 1                   ;write only
	mov rdx, 0666o
	syscall
	
	mov rbx, rax
	
	mov rdi, rax
	mov rax, 8                   ; lseek
	mov rsi, 0                   ; Busca el final del archivo
	mov rdx, 2
	syscall
	
	mov rax, rbx
	
	mov rdi, rax
	mov rax, 1                   ;SYS_WRITE
	mov rsi, nfbuffer
	mov rdx, nfbuffersize
	syscall
	
	mov rax, 3                   ;SYS_CLOSE
	mov rdi, rbx
	syscall
	
	
bytesleft:                    ; Revisa por la bandera del espacio o del return
	cmp r13, 1
	je addspacebyte
	
	cmp r13, 0
	je loop_j_hyst
	
	jmp valzero
	
addspacebyte:                 ; Agrega el valor del ascii del espacio al buffer (32) y lo escribe
	mov al, 32
	mov [nfbuffer], al
	mov r13, 0
	jmp writefile
	
pow_10:                       ; Valor comienza en 1 y se multiplica por 10 cada loop para obtener 10 a la n
	cmp bl, ch
	je pow_10_ret
	
	inc bl
	mul r10
	
	jmp pow_10
	
pow_10_ret:
	mov r10, rax
	ret
	
done:
	mov rax, 60
	mov rdi, 0
	syscall
