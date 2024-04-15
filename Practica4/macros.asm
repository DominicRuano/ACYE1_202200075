
ImprimirMenuInicial MACRO 
    LimpiarConsola
    ImprimirCadenas salto

    ImprimirCadenasColor MSGMenu1, colorRojoTexto
    ImprimirCadenasColor MSGMenu2, colorRojoTexto
    ImprimirCadenasColor MSGMenu3, colorRojoTexto
    ImprimirCadenasColor MSGMenu4, colorRojoTexto

    ImprimirCadenas salto

    ImprimirCadenasColor MSG1OP1, colorCianTexto
    ImprimirCadenasColor MSG1OP2, colorCianTexto
    ImprimirCadenasColor MSG1OP3, colorCianTexto

    ImprimirCadenas salto

    ImprimirCadenasColor MSG2OP1, colorCianTexto
    ImprimirCadenasColor MSG2OP2, colorCianTexto
    ImprimirCadenasColor MSG2OP3, colorCianTexto

    ImprimirCadenas salto

    ImprimirCadenasColor MSG3OP1, colorCianTexto
    ImprimirCadenasColor MSG3OP2, colorCianTexto
    ImprimirCadenasColor MSG3OP3, colorCianTexto

    ImprimirCadenas salto

    ImprimirCadenasColor MSG4OP1, colorCianTexto
    ImprimirCadenasColor MSG4OP2, colorCianTexto
    ImprimirCadenasColor MSG4OP3, colorCianTexto
ENDM

obtenerOpcion MACRO regOpcion
    MOV AH, 01h
    INT 21h

    MOV regOpcion, AL
ENDM

obtenerString MACRO regBuffer, maxLength
    ; Inicializar índice y contador de longitud
    xor si, si

    ; Bucle para leer caracteres
    read_char_loop:
        ; Leer un carácter sin eco
        mov ah, 01h
        int 21h

        ; Verificar si es un enter (carácter ASCII 13)
        cmp al, 13
        je end_read

        ; Almacenar el carácter en el buffer
        mov [regBuffer + si], al

        ; Incrementar índice y contador de longitud
        inc si
        cmp si, maxLength
        jb read_char_loop

    end_read:
        ; Agregar el carácter de fin de cadena
        ;mov byte ptr [regBuffer + si], "$"
ENDM

LimpiarConsola MACRO
    MOV AX, 03h
    INT 10h
ENDM

ImprimirCadenas MACRO registroPrint
    MOV AH, 09h
    LEA DX, registroPrint
    INT 21h
ENDM

ImprimirCadenasColor MACRO registroPrint, color
    PUSH AX         ; Guardar el registro AX
    PUSH BX         ; Guardar el registro BX
    PUSH CX         ; Guardar el registro CX

    ; Establecer el color de la letra para la pantalla
    MOV AH, 09h     ; Función de BIOS para escribir carácter y atributo
    MOV AL, ' '     ; Carácter a escribir (espacio en este caso)
    MOV BH, 0       ; Página de video (usualmente 0)
    MOV BL, color   ; Color del texto (4 bits de fondo, 4 bits de texto)
    MOV CX, lengthof registroPrint       ; Número de veces que se escribe el carácter
    INT 10h         ; Interrupción de video

    ; Imprimir la cadena en pantalla
    MOV AH, 09h     ; Función de DOS para imprimir cadena
    LEA DX, registroPrint ; Carga la dirección de la cadena en DX
    INT 21h         ; Interrupción de DOS para imprimir la cadena

    POP CX          ; Restaurar el registro CX
    POP BX          ; Restaurar el registro BX
    POP AX          ; Restaurar el registro AX
ENDM