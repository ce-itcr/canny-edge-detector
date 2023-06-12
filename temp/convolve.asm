section .data
    imagen times 300*300 db 0 

    kernel db -1, 0, 1, -2, 0, 2, -1, 0, 1
    nombre_archivo db '../static/input.txt', 0 
    nombre_archivo_salida db '../static/result.txt', 0 

section .text
global _start

_start:

    mov eax, 2 ; sys_open
    mov edi, nombre_archivo
    xor esi, esi ; O_RDONLY
    xor edx, edx ; Modo de apertura 0
    syscall

    cmp eax, -1
    jle error_opening_file

    mov ebx, eax

    mov eax, 0x1 ; sys_read
    mov edi, ebx ; Descriptor de archivo
    mov rsi, imagen ; Dirección de memoria para almacenar los valores
    mov edx, 300*300 ; Tamaño del archivo a leer
    syscall

    mov eax, 0x3 ; sys_close
    mov edi, ebx ; Descriptor de archivo
    syscall

    ; Guardar la dirección de la imagen en ecx
    mov ecx, imagen

    ; Cargar la dirección del kernel en edx
    mov edx, kernel

    ; Cargar el tamaño del kernel (9 bytes) en ebx
    mov ebx, 9

    ; Calcular el tamaño de la imagen (300x300 bytes) en eax
    mov eax, 300 * 300

    ; Reservar memoria para el resultado de la convolución
    push rax
    mov eax, 0x9 ; sys_mmap
    xor edi, edi ; Dirección de inicio de asignación: NULL
    mov rsi, rax ; Tamaño: tamaño de la imagen
    mov edx, 0x22 ; PROT_READ | PROT_WRITE
    mov ecx, 0x21 ; MAP_PRIVATE | MAP_ANONYMOUS
    xor r8d, r8d ; Descriptor de archivo: -1
    mov r9, 0 ; Offset: 0
    syscall
    add rsp, 8 ; Descartar el tamaño del resultado de convolución reservado

    ; Realizar la convolución para cada píxel
    mov edi, 0 ; Contador de píxeles procesados
    convolucion_loop:
        ; Calcular la posición del píxel en la imagen
        mov eax, ecx
        imul eax, 300
        add eax, edi

        ; Calcular la convolución para el píxel actual
        push rbx ; Guardar el valor de ebx
        xor ebx, ebx ; Acumulador para el resultado de la convolución
        mov edx, 9 ; Contador para el kernel
        convolucion_inner_loop:
            mov dl, byte [edx + esi] ; Cargar valor del kernel
            ;imul dl, byte [eax + edx - 5] ; Multiplicar por el píxel 
            
            movzx ecx, byte [eax + edx - 5] ; Extender el valor de 8 bits a 32 bits sin signo
            movzx ebx, dl ; Extender el valor de 8 bits a 32 bits sin signo
            imul ebx, ecx ; Multiplicar los valores extendidos
            mov dl, bl ; Mover el byte menos significativo del resultado de vuelta a dl


            add bl, dl ; Acumular el resultado de la convolución
            dec edx
            loop convolucion_inner_loop
        pop rbx ; Restaurar el valor de ebx

        ; Guardar el resultado de la convolución en el resultado
        mov byte [ecx + edi], bl

        ; Incrementar el contador de píxeles procesados
        inc edi

        ; Verificar si se han procesado todos los píxeles
        cmp edi, 300*300
        jl convolucion_loop

    mov eax, 2 ; sys_open
    mov edi, nombre_archivo_salida
    xor esi, esi ; O_CREAT
    xor edx, edx ; Modo de apertura 0
    syscall

    cmp eax, -1
    jle error_opening_output_file

    ; Guardar el descriptor de archivo en ebx
    mov ebx, eax

    ; Escribir el resultado en el archivo de salida
    mov eax, 0x1 ; sys_write
    mov edi, ebx ; Descriptor de archivo
   ; mov rsi, ecx ; Dirección de memoria del resultado
    movsxd rsi, ecx ; Extender la dirección de 32 bits a 64 bits

    mov edx, 300*300 ; Tamaño del resultado
    syscall

    ; Cerrar el archivo de salida
    mov eax, 0x3 ; sys_close
    mov edi, ebx ; Descriptor de archivo
    syscall

    ; Finalizar el programa
    mov eax, 0x1 ; sys_exit
    xor ebx, ebx ; Código de salida 0
    syscall

error_opening_file:
    ret

error_opening_output_file:
    ret
