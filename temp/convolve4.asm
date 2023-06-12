section .data
    input_file db '../static/input.txt', 0
    output_file db '../static/result.txt', 0
    image_size equ 300
    kernel_size equ 3
    kernel db -1, 0, 1, -2, 0, 2, -1, 0, 1
    image times image_size * image_size db 0
    result times image_size * image_size db 0
    progress_message db "Processing: %d%%", 10, 0
    buffer times 16 db 0

section .text
    global _start

_start:
    ; Abrir el archivo de entrada
    mov eax, 5
    mov edi, input_file
    xor esi, esi
    xor edx, edx
    syscall

    ; Leer el contenido del archivo de entrada en la matriz de imagen
    mov eax, 3
    mov edi, eax
    mov esi, image
    mov edx, image_size * image_size
    syscall

    ; Realizar la convolución
    mov ecx, image_size
    dec ecx

convolution_loop:
    mov ebx, 0

convolution_inner_loop:
    ; Inicializar el acumulador
    xor eax, eax

    ; Aplicar el kernel de convolución
    mov edi, kernel

kernel_loop:
    movzx edx, byte [image + ebx]
    movzx esi, byte [edi]
    imul edx, esi
    add eax, edx

    inc edi
    add ebx, 1
    cmp ebx, kernel_size
    jl kernel_loop

    mov byte [result + ecx], al

    inc ecx
    cmp ecx, image_size
    jnz convolution_inner_loop

    ; Abrir el archivo de salida
    mov eax, 5
    mov edi, output_file
    mov esi, 0x21
    xor edx, edx
    syscall

    ; Escribir el contenido de la matriz de resultado en el archivo de salida
    mov eax, 1
    mov edi, eax
    mov esi, result
    mov edx, image_size * image_size
    syscall

    ; Cerrar el archivo de entrada
    mov eax, 6
    mov edi, 3
    syscall

    ; Cerrar el archivo de salida
    mov eax, 6
    mov edi, 1
    syscall

    ; Salir del programa
    mov eax, 60
    xor edi, edi
    syscall
