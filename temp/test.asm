section .data
	filename db "res.txt", 0
	newfilename db "res2.txt", 0
	buffersize equ 10
	nfbuffersize equ 10
	
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


_filesize:

	mov rax, 2		;SYS_OPEN
	mov rdi, filename
	mov rsi, 0		;read only
	mov rdx, 0666o
	syscall

	mov rdi, rax
	mov rax, 8 
	mov rsi, 0
	mov rdx, 2
	syscall

	mov r9, rax
	dec r9

	mov rax, 3
	mov rdi, rbx
	syscall

	mov rax, 0                   ; count
	push rax
	mov r8, 0
	
readfile:
	mov rax, 2                   ;SYS_OPEN
	mov rdi, filename
	mov rsi, 0                   ;read only
	mov rdx, 0666o
	syscall
	
	mov rbx, rax
	
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

	add r8, 10
	
	
	
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
	mov rsi, buffer
	mov rdx, buffersize
	syscall
	
	mov rax, 3                   ;SYS_CLOSE
	mov rdi, rbx
	syscall

	cmp r8, r9
	jge done

	jmp readfile
	
done:
	mov rax, 60
	mov rdi, 0
	syscall
