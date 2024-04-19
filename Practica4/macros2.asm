
PrintTablero MACRO 
                    mov ax, 13h
                    int 10h                 ; Establecer modo gráfico 13h
                    DrawSprite wall_four, 08h, 20h, 8h, 8h
                    DrawSprite wall_four, 10h, 20h, 8h, 8h
                    DrawSprite wall_six, 18h, 20h, 8h, 8h
                    DrawSprite wall_four, 20h, 20h, 8h, 8h
                    DrawSprite wall_four, 28h, 20h, 8h, 8h
                    DrawSprite wall_six, 30h, 20h, 8h, 8h
                    DrawSprite wall_four, 38h, 20h, 8h, 8h
                    DrawSprite wall_four, 40h, 20h, 8h, 8h

                    DrawSprite wall_four, 08h, 38h, 8h, 8h
                    DrawSprite wall_four, 10h, 38h, 8h, 8h
                    DrawSprite wall_six, 18h, 38h, 8h, 8h
                    DrawSprite wall_four, 20h, 38h, 8h, 8h
                    DrawSprite wall_four, 28h, 38h, 8h, 8h
                    DrawSprite wall_six, 30h, 38h, 8h, 8h
                    DrawSprite wall_four, 38h, 38h, 8h, 8h
                    DrawSprite wall_four, 40h, 38h, 8h, 8h

                    DrawSprite wall_three, 18h, 10h, 8h, 8h
                    DrawSprite wall_three, 18h, 18h, 8h, 8h
                    DrawSprite wall_three, 30h, 10h, 8h, 8h
                    DrawSprite wall_three, 30h, 18h, 8h, 8h

                    DrawSprite wall_three, 18h, 28h, 8h, 8h
                    DrawSprite wall_three, 18h, 30h, 8h, 8h
                    DrawSprite wall_three, 30h, 28h, 8h, 8h
                    DrawSprite wall_three, 30h, 30h, 8h, 8h

                    DrawSprite wall_three, 18h, 40h, 8h, 8h
                    DrawSprite wall_three, 18h, 48h, 8h, 8h
                    DrawSprite wall_three, 30h, 40h, 8h, 8h
                    DrawSprite wall_three, 30h, 48h, 8h, 8h

                    ;DrawSprite barrax_uno, 08h, 10h, 8h, 8h
                    ;DrawSprite barrax_dos, 08h, 18h, 8h, 8h
                    ;DrawSprite barrax_dos, 10h, 10h, 8h, 8h
                    ;DrawSprite barrax_uno, 10h, 18h, 8h, 8h

                    ;DrawSprite barrao_uno, 20h, 28h, 8h, 8h
                    ;DrawSprite barrao_dos, 20h, 30h, 8h, 8h
                    ;DrawSprite barrao_tres, 28h, 28h, 8h, 8h
                    ;DrawSprite barrao_cuatro, 28h, 30h, 8h, 8h
ENDM

Sleep MACRO params
    mov cx, params ; tiempo de espera alto
    mov dx, 0          ; tiempo de espera bajo
    mov ah, 86h        ; función de espera del BIOS
    int 15h            ; llama a la interrupción del BIOS
ENDM

DrawSprite MACRO sprite_ptr, x, y, width, height
LOCAL draw_lines
    pusha                   ; Guardar todos los registros para restaurarlos después
    mov ax, 0A000h          ; Segmento de memoria de video para modo 13h
    mov es, ax              ; Establece ES al segmento de memoria de video

    mov si, offset sprite_ptr      ; SI apunta a los datos del sprite en la sección .data
    mov bx, y               ; BX es la posición Y
    mov dx, x               ; DX es la posición X

    ; Calcular el offset inicial en la memoria de video
    mov ax, 320             ; Ancho de la pantalla en píxeles
    mul bx                  ; AX = 320 * Y
    add ax, x              ; AX = 320 * Y + X
    mov di, ax              ; DI = desplazamiento en el segmento de video

    mov bx, height          ; BX = Altura del sprite
draw_lines:                 ; Etiqueta para el bucle que dibuja las líneas
    mov cx, width           ; CX = Ancho del sprite
    rep movsb               ; Mover línea del sprite a la memoria de video
    add di, 320             ; Saltar al inicio de la siguiente línea en el buffer de pantalla
    sub di, width           ; Ajustar DI al inicio correcto de la siguiente línea
    dec bx                  ; Decrementar contador de altura
    jnz draw_lines          ; Continuar si aún quedan líneas por dibujar

    popa                    ; Restaurar los registros
ENDM

GetName MACRO String, Player
LOCAL Start, end
Start:
    LimpiarConsola
    CleanNameVars
    ImprimirCadenas salto

    ImprimirCadenasColor String, colorAmarilloTexto
    obtenerString Player, 15
    
    ImprimirCadenas salto

    ImprimirCadenasColor OpcionYN1, colorMagentaTexto
    ImprimirCadenasColor Player, colorMagentaTexto
    ImprimirCadenasColor OpcionYN2, colorMagentaTexto
    obtenerOpcion opcion

    CMP opcion, 'y'
    JE end

    CMP opcion, 'Y'
    JE end

    JMP Start

end:
ENDM

CleanNameVars MACRO
LOCAL Inicio
    mov si, 0h
Inicio:
    mov Jugador1[si], 32
    mov Jugador2[si], 32
    inc si

    cmp si, 0fh
    jne Inicio
ENDM

ImprimirInformacion MACRO 
    ImprimirCadenasColor Info11, colorRojoTexto
    ImprimirCadenasColor Info12, colorRojoTexto
    ImprimirCadenasColor Info13, colorRojoTexto
    ImprimirCadenasColor Info14, colorRojoTexto
    ImprimirCadenasColor Info15, colorRojoTexto
    ImprimirCadenasColor Info16, colorRojoTexto

    ImprimirCadenas salto

    ImprimirCadenasColor Info21, colorVerdeClaroTexto
    ImprimirCadenasColor Info22, colorVerdeClaroTexto
    ImprimirCadenasColor Info23, colorVerdeClaroTexto

    ImprimirCadenasColor Info32, colorVerdeClaroTexto

    ImprimirCadenasColor Info41, colorVerdeClaroTexto
    ImprimirCadenasColor Info42, colorVerdeClaroTexto

    ImprimirCadenasColor Info51, colorVerdeClaroTexto
    ImprimirCadenasColor Info52, colorVerdeClaroTexto
    ImprimirCadenasColor Info53, colorVerdeClaroTexto
    ImprimirCadenasColor Info54, colorVerdeClaroTexto

    ImprimirCadenasColor Info61, colorVerdeClaroTexto
    ImprimirCadenasColor Info62, colorVerdeClaroTexto

    ImprimirCadenasColor Info71, colorVerdeClaroTexto
    ImprimirCadenasColor Info72, colorVerdeClaroTexto
    ImprimirCadenasColor Info73, colorVerdeClaroTexto

ENDM

ImprimirReporte MACRO
    ImprimirCadenasColor REPORTE1, colorAmarilloTexto
    ImprimirCadenasColor REPORTE2, colorAmarilloTexto
    ImprimirCadenasColor REPORTE3, colorAmarilloTexto
    ImprimirCadenasColor REPORTE4, colorAmarilloTexto
    PresioneTeclaParaContinuar
ENDM

ImprimirNuevoJuego MACRO
    LimpiarConsola
    ImprimirCadenas salto

    ImprimirCadenasColor MSG0NG1, colorRojoClaroTexto
    ImprimirCadenasColor MSG0NG2, colorRojoClaroTexto
    ImprimirCadenasColor MSG0NG3, colorRojoClaroTexto
    ImprimirCadenasColor MSG0NG4, colorRojoClaroTexto

    ImprimirCadenas Salto

    ImprimirCadenasColor MSG1NG1, colorCianClaroTexto
    ImprimirCadenasColor MSG1NG2, colorCianClaroTexto
    ImprimirCadenasColor MSG1NG3, colorCianClaroTexto
    ImprimirCadenasColor MSG1NG4, colorCianClaroTexto

    ;ImprimirCadenas salto

    ImprimirCadenasColor MSG2NG1, colorCianClaroTexto
    ImprimirCadenasColor MSG2NG2, colorCianClaroTexto
    ImprimirCadenasColor MSG2NG3, colorCianClaroTexto
    ImprimirCadenasColor MSG2NG4, colorCianClaroTexto

    ;ImprimirCadenas salto

    ImprimirCadenasColor MSG3NG1, colorCianClaroTexto
    ImprimirCadenasColor MSG3NG2, colorCianClaroTexto
    ImprimirCadenasColor MSG3NG3, colorCianClaroTexto
    ImprimirCadenasColor MSG3NG4, colorCianClaroTexto

    ;ImprimirCadenas salto

    ImprimirCadenasColor MSG4NG1, colorCianClaroTexto
    ImprimirCadenasColor MSG4NG2, colorCianClaroTexto
    ImprimirCadenasColor MSG4NG3, colorCianClaroTexto
    ImprimirCadenasColor MSG4NG4, colorCianClaroTexto

    ImprimirCadenas salto
ENDM

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

    ImprimirCadenas salto
ENDM

obtenerOpcion MACRO regOpcion
    MOV AH, 01h
    INT 21h

    MOV regOpcion, AL
ENDM

obtenerString MACRO regBuffer, maxLength
LOCAL read_char_loop, end_read
    ; Inicializar índice y contador de longitud
    xor si, si

    ; Establecer el color de la letra para la pantalla
    MOV AH, 09h     ; Función de BIOS para escribir carácter y atributo
    MOV AL, ' '     ; Carácter a escribir (espacio en este caso)
    MOV BH, 0       ; Página de video (usualmente 0)
    MOV BL, colorRojoTexto   ; Color del texto (4 bits de fondo, 4 bits de texto)
    MOV CX, lengthof regBuffer       ; Número de veces que se escribe el carácter
    INT 10h         ; Interrupción de video

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

PresioneTeclaParaContinuar MACRO 
    ImprimirCadenas salto
    ImprimirCadenas salto
    ImprimirCadenasColor PParaContinuar, colorCianTexto
    obtenerOpcion opcion
ENDM
