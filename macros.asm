
MACROImprimirReportes MACRO
    
ENDM

MACROImprimirPuntajes MACRO 
    LimpiarConsola

    ImprimirCadenas salto
    ImprimirCadenas salto
    ImprimirCadenas salto

    ImprimirCadenas tab

    ImprimirCadenas Puntajes
    ImprimirCadenas salto

    AbrirArchivo
    ;EscribirArchivo
    CerrarArchivo

    ImprimirCadenas dataTXT

    ImprimirCadenas PrecioneParaContinuar
    obtenerOpcion opcion
ENDM

AbrirArchivo MACRO
    mov ah, 3Dh  ; Función 3Dh: Abrir archivo existente
    mov al, 0    ; Modo de acceso: lectura
    lea dx, nombreDB  ; Nombre del archivo
    int 21h      ; Llamar a DOS
    jc file_not_found  ; Saltar si el archivo no se encuentra

    ; El archivo existe, leer su contenido
    mov filehandle, ax  ; Guardar manejador de archivo
    jmp read_file

file_not_found:
    ; Crear el archivo si no existe
    mov ah, 3Ch  ; Función 3Ch: Crear archivo
    xor cx, cx   ; Atributos de archivo: normal
    lea dx, nombreDB  ; Nombre del archivo
    int 21h      ; Llamar a DOS
    mov filehandle, ax  ; Guardar manejador de archivo

read_file:
    ; Leer el contenido del archivo en el buffer
    mov ah, 3Fh  ; Función 3Fh: Leer de archivo
    mov bx, filehandle  ; Manejador de archivo
    lea dx, dataTXT      ; Buffer para leer el contenido
    mov cx, sizeof dataTXT  ; Tamaño del buffer
    int 21h      ; Llamar a DOS
    mov bytesRead, ax  ; Guardar el número de bytes leídos
ENDM

;AbrirArchivo MACRO
;    mov ah, 3Ch  ; Función 3Ch: Crear archivo
;    xor cx, cx   ; Atributos de archivo: normal
;    lea dx, nombreDB  ; Nombre del archivo
;    int 21h      ; Llamar a DOS
;    mov filehandle, ax  ; Guardar manejador de archivo
;ENDM

EscribirArchivo MACRO params
    mov ah, 40h  ; Función 40h: Escribir en archivo
    mov bx, filehandle  ; Manejador de archivo
    lea dx, params     ; Mensaje a escribir
    mov cx, lengthof params  ; Número de bytes a escribir
    int 21h      ; Llamar a DOS
ENDM

CerrarArchivo MACRO
    mov ah, 3Eh  ; Función 3Eh: Cerrar archivo
    mov bx, filehandle  ; Manejador de archivo
    int 21h      ; Llamar a DOS
ENDM

MACROImprimirTablero MACRO 
    LimpiarConsola
    getNombre Jugador
    obtenerOpcion opcion            
    
    CMP opcion, 121
    JE NombreCorrecto

    JMP ImprimirTablero

NombreCorrecto:
    LlenarTablero
    CopiarTablero tablero, tableroAux
    getMinSeg horaSTRInicio, hora, minuto, segundos

Jugar:
    LimpiarConsola
    getMinSeg2 horaSTRInicio
    PrintTableroYEncabezado Jugador, tablero
    ImprimirCadenas salto
    ObtenerMov

    LimpiarConsola
    getMinSeg2 horaSTRInicio
    PrintTableroYEncabezado Ia, tableroAux
    ImprimirCadenas salto
    ObtenerMov

    JMP Jugar
ENDM

MACROMenu MACRO
    LimpiarConsola
    ImprimirCadenas mensajeInicio
    ImprimirCadenas mensajeMenu
    obtenerOpcion opcion ; Obtener La Opcion Que El Usuario Elige

    CMP opcion, 49 ; Estimulando el registro de banderas
    JE ImprimirTablero

    CMP opcion, 50
    JE ImprimirPuntajes

    CMP opcion, 51
    JE ImprimirReportes

    CMP opcion, 52
    JE Salir

    JMP Menu
    
ENDM

CopiarTablero MACRO tableroOR, tableroCopy
    MOV si, 0h

InicioCopiaTablero:
    mov AL, tableroOR[si]
    mov tableroCopy[si], AL
    INC SI

    CMP Si, 40h
    JNE InicioCopiaTablero

    mov [tableroCopy + si], "$"
ENDM

ObtenerMov MACRO
    ObtenerFila Sfila
    ObtenerColumna Scolumna
ENDM

ObtenerFila MACRO valor
    LOCAL inicioDeFila
    inicioDeFila:
        ImprimirCadenas salto       ; imprime ingrese fila
        ImprimirCadenas Ifila
        obtenerOpcion valor

        CMP valor, 49
        JB inicioDeFila

        CMP valor, 56
        JA inicioDeFila
ENDM

ObtenerColumna MACRO valor
    LOCAL InicioColumna
    InicioColumna:
        ImprimirCadenas salto       ; imprime ingrese columna
        ImprimirCadenas Icolumna
        obtenerOpcion valor

        CMP valor, 97
        JB InicioColumna

        CMP valor, 104
        JA InicioColumna
ENDM

PrecioneCualquierTecla MACRO
    ImprimirCadenas salto
    ImprimirCadenas PrecioneParaContinuar
    obtenerOpcion opcion
ENDM

getNombre MACRO params
    ImprimirCadenas salto
    ImprimirCadenas nombre
    obtenerString params, 15

    ImprimirCadenas salto
    ImprimirCadenas nombre2
    ImprimirCadenas params
    ImprimirCadenas salto
    ImprimirCadenas nombre3
ENDM

getMinSeg2 MACRO STR
    compararHora
    convertirHoraASCII minuto, segundos, holaSTRFinal
ENDM

getMinSeg MACRO STR, hora, min , segs
    guardarHora hora,  min, segs
    convertirHoraASCII min, segs, STR
ENDM

guardarHora MACRO hora, minutos, segundos
    mov ah, 2Ch       ; Servicio para obtener la hora actual
    int 21h           ; Llamar a la interrupción DOS
    mov [hora], ch ; Guardar hora
    mov [hora + 1], "$"
    mov [minutos], cl ; Guardar minutos
    mov [minutos + 1], "$"
    mov [segundos], dh ; Guardar minutos
    mov [segundos + 1], "$" 
ENDM

convertirDigito MACRO digito
    add digito, '0'  ; Convertir el dígito numérico a ASCII ('0' = 48 en ASCII)
ENDM

convertirHoraASCII MACRO hora, minutos, buffer
    ; Convertir y almacenar la hora
    mov al, hora         ; Cargar la hora
    mov ah, 0            ; Limpiar AH para la división
    mov bl, 10           ; Divisor para separar los dígitos
    div bl               ; Dividir AL por 10 (AL = cociente, AH = resto)
    convertirDigito ah   ; Convertir el dígito de las decenas a ASCII
    mov [buffer + 1], ah     ; Almacenar el dígito de las decenas en el buffer
    convertirDigito al   ; Convertir el dígito de las unidades a ASCII
    mov [buffer], al ; Almacenar el dígito de las unidades en el buffer

    ; Almacenar el separador ':'
    mov byte ptr [buffer + 2], ':'

    ; Convertir y almacenar los minutos
    mov al, minutos      ; Cargar los minutos
    mov ah, 0            ; Limpiar AH para la división
    div bl               ; Dividir AL por 10 (AL = cociente, AH = resto)
    convertirDigito ah   ; Convertir el dígito de las decenas a ASCII
    mov [buffer + 4], ah ; Almacenar el dígito de las decenas en el buffer
    convertirDigito al   ; Convertir el dígito de las unidades a ASCII
    mov [buffer + 3], al ; Almacenar el dígito de las unidades en el buffer

    ; Agregar el carácter de fin de cadena
    mov byte ptr [buffer + 5], '$'
ENDM

compararHora MACRO
    mov ah, 2Ch       ; Servicio para obtener la hora actual
    int 21h           ; Llamar a la interrupción DOS
    mov [horaFn], ch ; Guardar hora
    mov [horaFn + 1], "$"
    mov [minutosFn], cl ; Guardar minutos
    mov [minutosFn + 1], "$"
    mov [segundosFn], dh ; Guardar minutos
    mov [segundosFn + 1], "$"

    mov al, segundosFn
    cmp ah, segundos
    SUB al, ah

    ;ImprimirCadenas segundosFn



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
        mov byte ptr [regBuffer + si], "$"
ENDM

PrintTableroYEncabezado MACRO player, tab
    ImprimirCadenas espacio
    ImprimirCadenas Jugador
    ImprimirCadenas Tencabezado2
    ImprimirCadenas player
    ImprimirCadenas Tencabezado3
    ImprimirCadenas horaSTRInicio
    ImprimirCadenas salto

    ImprimirTableroJuego tab
ENDM

ImprimirTableroJuego MACRO params
    LOCAL fila, columna

    MOV BX, 0 ; Indice del indicador de filas -> Inicia en 0
    XOR SI, SI ; Indice para el tablero -> Inicia en 0

    ImprimirCadenas indicadorColumnas
    MOV CL, 0 ; Contador de columnas

    fila:
        ImprimirCadenas salto
        MOV AH, 02h ; Codigo Interrupcion para imprimir un caracter
        MOV DL, indicadorFilas[BX] ; Caracter a imprimir
        INT 21h ; Llamar Interrupcion

        MOV DL, 32 ; Caracter del espacio en blanco
        INT 21h

        columna:
            MOV DL, params[SI] ; Caracter del tablero
            INT 21h

            MOV DL, 124 ; Caracter |
            INT 21h

            INC CL ; Incrementamos CL en 1 -> CL++
            INC SI ; Incrementamos SI en 1 -> SI++

            CMP CL, 8 ; Si no ha pasado por las 8 columnas que regrese a la etiqueta 'columna'
            JB columna ; Salto a columna

            MOV CL, 0 ; Reiniciar Contador de columnas
            INC BX ; Incrementar indice indicador de filas -> BX++
            
            CMP BX, 8 ; Si no ha pasado por todas las filas que regrese a la etiqueta 'fila'
            JB fila
ENDM

LlenarTablero MACRO
    LOCAL llenarPeon1, llenarPeon2, Piezas1, Piezas2

    MOV SI, 0 ; Indice del tablero
    MOV CH, 0 ; Contador de peones

    Piezas1:
        MOV DX, 116 ; Caracter a guardar en el tablero
        MOV tablero[SI], DL ; Escribir caracter en el tablero
        PUSH DX ; Guardamos el registro en la pila
        INC SI ; Incrementamos indice de tablero -> SI++

        MOV DX, 99
        MOV tablero[SI], DL
        PUSH DX
        INC SI

        MOV DX, 97
        MOV tablero[SI], DL
        PUSH DX
        INC SI

        MOV DX, 114
        MOV tablero[SI], DL
        INC SI

        MOV DX, 35
        MOV tablero[SI], DL
        INC SI

        POP DX ; Extraemos registro de la pila y lo almacenamos en DX
        MOV tablero[SI], DL ; Escribimos caracter en el tablero
        INC SI ; Incrementamos indice de tablero -> SI++

        POP DX
        MOV tablero[SI], DL
        INC SI

        POP DX
        MOV tablero[SI], DL
        INC SI
    
    llenarPeon1:
        MOV tablero[SI], 112 ; Escribir caracter en tablero
        INC SI ; Incrementamos indice del tablero
        INC CH ; Incrementamos contador de peones

        CMP CH, 8 ; Si es menor a 8 que regrese a la etiqueta 'llenarPeon1', caso contrario continua
        JB llenarPeon1

        MOV CH, 0
        MOV SI, 48

    llenarPeon2:
        MOV tablero[SI], 80
        INC SI
        INC CH

        CMP CH, 8
        JB llenarPeon2

    Piezas2:
        MOV DX, 84
        MOV tablero[SI], DL
        PUSH DX
        INC SI

        MOV DX, 67
        MOV tablero[SI], DL
        PUSH DX
        INC SI

        MOV DX, 65
        MOV tablero[SI], DL
        PUSH DX
        INC SI

        MOV DX, 82
        MOV tablero[SI], DL
        INC SI

        MOV DX, 42
        MOV tablero[SI], DL
        INC SI

        POP DX
        MOV tablero[SI], DL
        INC SI

        POP DX
        MOV tablero[SI], DL
        INC SI

        POP DX
        MOV tablero[SI], DL
        INC SI
ENDM