section .text

start:
    xor eax, eax    ; Limpia el registro EAX
    mov ecx, eax    ; Establece el contador a cero

    mov eax, 0x21   ; Función 0x21: Crear o abrir un archivo
    xor ebx, ebx    ; Establece los atributos del archivo a cero (no se aplican)
    mov edx, filename   ; Dirección de memoria que contiene el nombre del archivo
    int 0x80        ; Llama a la interrupción 0x80 para invocar la función

    mov eax, 0x6   ; Función 0x6: Cerrar un archivo
    mov ebx, eax    ; Obtiene el identificador del archivo devuelto anteriormente
    int 0x80        ; Llama a la interrupción 0x80 para invocar la función

    mov eax, 0x1   ; Función 0x1: Salir del programa
    xor ebx, ebx    ; Código de salida cero
    int 0x80        ; Llama a la interrupción 0x80 para invocar la función

filename db "empty.txt", 0    ; Nombre del archivo a crear (puedes cambiarlo)



