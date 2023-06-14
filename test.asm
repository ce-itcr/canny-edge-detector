section .data
    filename db "static/input.txt", 0
    file_mode dw 0666

section .bss
    image_width equ 300 ; Ancho de la imagen
    image_height equ 300 ; Alto de la image
    width equ 4 ; Tamaño en bytes de cada píxel
    image_size equ image_width * image_height * width
    
    degree_to_radian equ 5729 ; Factor de conversión de grados a radianes (0.0174533 * 32768)
    pi equ 3217 ; Valor de Pi (3.14159265 * 1024)
    image               resb image_width * image_height
    grad_x              resb image_width * image_height
    grad_y              resb image_width * image_height
    gradient_magnitude  resb image_width * image_height
    non_max_suppression_data resb image_width * image_height

section .text
    global _start

_start:
    ; Cargar la imagen en memoria
    mov eax, image
    mov ebx, image_width * image_height
    call read_image

    ; Calcular el gradiente en X
    mov eax, grad_x
    mov ebx, image
    mov ecx, image_width
    mov edx, image_height
    call calculate_gradient_x

    ; Calcular el gradiente en Y
    mov eax, grad_y
    mov ebx, image
    mov ecx, image_width
    mov edx, image_height
    call calculate_gradient_y

    ; Calcular la magnitud del gradiente
    mov eax, gradient_magnitude
    mov ebx, grad_x
    mov ecx, grad_y
    mov edx, image_width
    mov edi, image_height
    call calculate_gradient_magnitude

    ; Supresión de no máximos
    mov eax, non_max_suppression
    mov ebx, gradient_magnitude
    mov ecx, image_width
    mov edx, image_height
    call non_max_suppression

    ; Aplicar umbralización y seguimiento de bordes
    mov eax, image
    mov ebx, non_max_suppression
    mov ecx, image_width
    mov edx, image_height
    call threshold

    ; Guardar la imagen procesada en un archivo
    mov eax, image
    mov ebx, image_width * image_height
    call write_image

    ; Finalizar el programa
    mov eax, 1
    xor ebx, ebx
    int 0x80

; Función para leer la imagen desde un archivo
read_image:
    ; Cargar el nombre del archivo en el registro eax
    mov eax, filename
    ; Abrir el archivo en modo lectura
    mov ebx, 0
    mov ecx, 0
    int 0x80

    ; Leer el contenido del archivo en memoria
    mov ebx, eax    ; Descriptor de archivo
    mov ecx, image  ; Dirección de memoria para almacenar los datos
    mov edx, image_width * image_height  ; Tamaño a leer
    mov eax, 3      ; Llamada al sistema para leer
    int 0x80

    ; Cerrar el archivo
    mov ebx, eax    ; Descriptor de archivo
    mov eax, 6      ; Llamada al sistema para cerrar
    int 0x80

    ret

; Función para escribir la imagen en un archivo
write_image:
    ; Cargar el nombre del archivo en el registro eax
    mov eax, filename
    ; Abrir el archivo en modo escritura
    mov ebx, 1
    mov ecx, 1
    int 0x80

    ; Escribir el contenido de la imagen en el archivo
    mov ebx, eax    ; Descriptor de archivo
    mov ecx, image  ; Dirección de memoria con los datos
    mov edx, image_width * image_height  ; Tamaño a escribir
    mov eax, 4      ; Llamada al sistema para escribir
    int 0x80

    ; Cerrar el archivo
    mov ebx, eax    ; Descriptor de archivo
    mov eax, 6      ; Llamada al sistema para cerrar
    int 0x80

    ret

; Función para calcular el gradiente en X
calculate_gradient_x:
    xor esi, esi ; Inicializar el índice de la imagen a 0
    xor edi, edi ; Inicializar el índice del gradiente en X a 0

calculate_gradient_x_loop:
    ; Obtener el valor del píxel actual y los píxeles adyacentes
    mov al, [ebx + esi]
    mov cl, [ebx + esi + 1]
    mov dl, [ebx + esi - 1]

    ; Calcular la diferencia entre los píxeles adyacentes
    sub cl, dl

    ; Guardar el resultado en el gradiente en X
    mov [eax + edi], cl

    ; Incrementar los índices
    inc esi
    inc edi

    ; Verificar si hemos alcanzado el final de la fila
    cmp esi, ecx
    jne calculate_gradient_x_loop_end

    ; Saltar al inicio de la siguiente fila
    add esi, 2
    jmp calculate_gradient_x_loop

calculate_gradient_x_loop_end:
    ret

; Función para calcular el gradiente en Y
; Función para calcular el gradiente en la dirección Y de la imagen
; calculate_gradient_y:
;     xor esi, esi ; Inicializar el índice de la imagen a 0
;     xor ebx, ebx ; Inicializar el índice de la imagen de salida a 0

;     ; Inicializar el registro xmm0 a 0
;     pxor xmm0, xmm0

; calculate_gradient_y_loop:
;     ; Cargar los píxeles superiores e inferiores
;     mov al, [eax + esi - width]
;     mov dl, [eax + esi + width]

;     ; Restar los valores de los píxeles y almacenar el resultado en xmm0
;     sub al, dl
;     ;punpcklbw xmm1, al

;     ; Cargar el valor de al en un registro XMM temporal xmm0
;     movd xmm0, eax

;     ; Expandir el valor de xmm0 a xmm1
;     punpcklbw xmm1, xmm0


;     paddsw xmm0, xmm1

;     ; Incrementar los índices
;     inc esi
;     inc ebx

;     ; Verificar si hemos alcanzado el final de la imagen
;     cmp esi, edx
;     jl calculate_gradient_y_loop

;     ; Empaquetar y almacenar los resultados en la imagen de salida
;     packuswb xmm0, xmm0
;     movd [ecx + ebx], xmm0

;     ret


calculate_gradient_y:
    xor esi, esi           ; Inicializar el índice de la imagen a 0
    xor ebx, ebx           ; Inicializar el índice de la imagen de salida a 0

calculate_gradient_y_loop:
    ; Calcular las direcciones de memoria de los píxeles superiores e inferiores
    mov edx, esi           ; edx = esi
    sub edx, image_width   ; edx = esi - image_width
    add edx, eax           ; edx = eax + (esi - image_width)

    ; Cargar los píxeles superiores e inferiores
    mov al, [edx]
    mov dl, [esi + eax]

    ; Restar los valores de los píxeles y almacenar el resultado en xmm0
    sub al, dl
    movd xmm0, eax         ; xmm0 = al

    ; Cargar xmm0 con ceros extendidos
    punpcklbw xmm0, xmm0

    ; Sumar xmm0 a xmm1
    paddsw xmm0, xmm1

    ; Incrementar los índices
    inc esi
    inc ebx

    ; Verificar si hemos alcanzado el final de la imagen
    cmp esi, image_size
    jl calculate_gradient_y_loop

    ; Empaquetar y almacenar los resultados en la imagen de salida
    packuswb xmm0, xmm0
    movd [ecx + ebx], xmm0

    ret


; Función para calcular la magnitud del gradiente
calculate_gradient_magnitude:
    xor esi, esi ; Inicializar el índice del gradiente en X a 0
    xor edi, edi ; Inicializar el índice del gradiente en Y a 0
    xor ebx, ebx ; Inicializar el índice de la magnitud del gradiente a 0

calculate_gradient_magnitude_loop:
    ; Cargar los valores de los gradientes en X e Y
    movzx edx, word [ecx + ebx]
    movzx eax, word [esi + ebx]

    ; Calcular la magnitud del gradiente utilizando el teorema de Pitágoras
    imul edx, edx
    imul eax, eax
    add edx, eax
    sqrtss xmm0, xmm0 ; Calcular la raíz cuadrada utilizando la instrucción sqrtss

    ; Almacenar el resultado en la imagen de salida
    movd [edi + ebx], xmm0

    ; Incrementar el índice
    add ebx, 4

    ; Verificar si hemos alcanzado el final de la imagen
    cmp ebx, ecx
    jl calculate_gradient_magnitude_loop

    ret



; Función para realizar la supresión de no máximos
non_max_suppression:
    ; Calcular el ángulo de orientación del gradiente
    mov eax, [esi + ebx]   ; Gradiente en X
    mov edx, [ecx + ebx]   ; Gradiente en Y
    mov edi, ebx           ; Guardar el índice actual

    ; Calcular el ángulo de orientación utilizando la arcotangente
    movaps xmm0, xmm1     ; Copiar el gradiente en X a xmm0
    movaps xmm1, xmm2     ; Copiar el gradiente en Y a xmm1
    movaps xmm2, xmm0     ; Hacer otra copia del gradiente en X
    mulps xmm0, xmm0      ; Calcular el cuadrado del gradiente en X
    mulps xmm1, xmm1      ; Calcular el cuadrado del gradiente en Y
    addps xmm0, xmm1      ; Sumar el cuadrado del gradiente en Y al cuadrado del gradiente en X
    sqrtps xmm0, xmm0     ; Calcular la raíz cuadrada del resultado
    divps xmm2, xmm0      ; Dividir el gradiente en X por el resultado
    movups [esp], xmm2    ; Almacenar el resultado en la pila

    fld dword [esp]       ; Cargar el resultado en el registro FPU
    fpatan                ; Calcular el arcotangente
    fstp dword [esp]      ; Almacenar el resultado en la pila

    ; Convertir el ángulo a grados
    fld dword [esp]       ; Cargar el resultado en el registro FPU
    fmul dword [degree_to_radian] ; Multiplicar por el factor de conversión de grados a radianes
    fstp dword [esp]      ; Almacenar el resultado en la pila
    fld dword [esp]       ; Cargar el resultado en el registro FPU
    fadd dword [pi]       ; Sumar el valor de pi al ángulo
    fstp dword [esp]      ; Almacenar el resultado en la pila
    fld dword [esp]       ; Cargar el resultado en el registro FPU
    fsin                  ; Calcular el seno del ángulo
    fstp dword [esp]      ; Almacenar el resultado en la pila

    ; Realizar la supresión de no máximos
    movss xmm0, dword [edi + ebx] ; Cargar el valor actual de la magnitud del gradiente
    cmpss xmm0, xmm0, 1 ; Comparar el valor actual con el siguiente
    ;jnae non_max_suppression_skip ; Saltar si no es un máximo local
    jbe non_max_suppression_skip
    ;movss dword [edi + ebx], 0 ; Establecer el valor a cero si no es un máximo local
    mov dword [edi + ebx], 0


non_max_suppression_skip:
    ; Incrementar el índice
    add ebx, 4

    ; Verificar si hemos alcanzado el final del bucle
    cmp ebx, [image_width]
    jl non_max_suppression

    ret

; Función para aplicar la umbralización a la imagen
threshold:
    xor esi, esi ; Inicializar el índice de la imagen a 0
    xor ebx, ebx ; Inicializar el índice de la imagen de salida a 0

threshold_loop:
    ; Obtener el valor del píxel actual
    mov al, [eax + esi]

    ; Comparar el valor del píxel con el umbral
    cmp al, cl
    jg threshold_above
    ; Si es menor o igual al umbral, establecer el píxel de salida en 0
    mov [edx + ebx], byte 0
    jmp threshold_next

threshold_above:
    ; Si es mayor al umbral, establecer el píxel de salida en 255
    mov [edx + ebx], byte 255

threshold_next:
    ; Incrementar los índices
    inc esi
    inc ebx

    ; Verificar si hemos alcanzado el final de la imagen
    cmp esi, edx
    jl threshold_loop

    ret
