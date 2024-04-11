
MakeMovimiento MACRO tab
    xor ax, ax
    xor bx, bx

    mov al, IndexTab        ; copio la posicion inicial de la pieza a al
    mov si, ax
    mov bl, tab[si]         ; copio el char en tablero de la posicion inicial a bl

    mov tab[si], 32         ; pongo un espacio en blanco en la posicion inicial del tablero

    mov al, IndexTab2       ; copio la posicion final de la pieza a al
    mov si, ax 
    mov tab[si], bl         ; copio el char en bl a la posicion final del tablero
ENDM

MovToInt MACRO fila, columna, destino
    xor ax, ax
    xor bx, bx

    mov bl, fila       ; copio fila a bl
    mov bh, columna    ; copio columna a bh

    sub bl, 48          ; convierto fila a numero hexadecimal
    sub bh, 96          ; convierto columna a numero hexadecimal

    dec bl              ; resto 1 a fila, (fila - 1)
    mov al, bl          
    mov bl, 8h

    mul bl              ; multiplico fila por 8, (fila - 1)*8

    add al, bh          ; sumo columna columna, (fila - 1)*8 + columna
    dec al

    xor ah, ah          ; limpio ah
    mov si, ax          ; copio posicion final a si
    mov destino, al    ; copio posicion final a IndexTab

ENDM

validarMOV MACRO 
LOCAL fin, JugadorTurno, IaTurno
    xor ax, ax
    mov al, IndexTab
    mov si, ax
    cmp Turno[0], 0
    je JugadorTurno
    jmp IaTurno

JugadorTurno:
    cmp tablero[si], 80   ; si la posicion inicial es un peon
    je fin
    cmp tablero[si], 84   ; si la posicion inicial es una torre
    je fin
    cmp tablero[si], 67   ; si la posicion inicial es un caballo
    je fin
    cmp tablero[si], 65   ; si la posicion inicial es un alfil
    je fin
    cmp tablero[si], 82   ; si la posicion inicial es una reina
    je fin
    cmp tablero[si], 42   ; si la posicion inicial es un rey
    je fin
    
    ImprimirCadenas ErrorMovJ
    PrecioneCualquierTecla
    jmp TurnoJugador

IaTurno:
    cmp tablero[si], 112   ; si la posicion inicial es un peon
    je fin
    cmp tablero[si], 116   ; si la posicion inicial es una torre
    je fin
    cmp tablero[si], 99   ; si la posicion inicial es un caballo
    je fin
    cmp tablero[si], 97   ; si la posicion inicial es un alfil
    je fin
    cmp tablero[si], 114   ; si la posicion inicial es una reina
    je fin
    cmp tablero[si], 35   ; si la posicion inicial es un rey
    je fin
    
    ImprimirCadenas ErrorMovI
    PrecioneCualquierTecla
    jmp TurnoIA


fin:
ENDM

CambioTurno MACRO
LOCAL TurnoIA, fin
    xor ax, ax

    mov al, Turno[0]

    cmp al, 0
    je TurnoIA

    mov Turno[0], 0     ; 0 = Jugador
    jmp fin

TurnoIA:
    mov Turno[0], 1     ; 1 = IA

fin:
ENDM

CleanName MACRO
LOCAL inicio, fin, change
    xor ax, ax
    xor bx, bx

    mov ax, 0Eh
    mov si, 00h

inicio:
    cmp si, ax
    je fin
    cmp Jugador[si], 32
    jne change
    inc si
    jmp inicio

change:
    mov Jugador[si], " "
    inc si
    jmp inicio

fin:
ENDM

borrarDBTEXT MACRO
    xor si, si
    xor bx, bx

    mov bl, "<"

inicio:
    cmp si, 100h
    je fin
    cmp dataTXT[si], bl
    je change
    inc si
    jmp inicio

change:
    mov dataTXT[si], 32
    inc si
    mov dataTXT[si], 32
    inc si
    mov dataTXT[si], 32
    inc si
    mov dataTXT[si], 32
    inc si
    jmp inicio

fin:
    Addtextoanterior
ENDM

Addtextoanterior MACRO
LOCAL inicio, fin
    xor si, si
    xor bx, bx

    mov si, 00h
    mov bl, "$"

inicio:
    cmp si, 100h
    je fin
    mov bh, dataTXT[si]
    cmp bh, bl
    je fin
    inc si
    jmp inicio

fin:
    EscribirArchivo2 dataTXT, si
ENDM

EndGame MACRO params
LOCAL inicio, valido, fin
    LimpiarConsola
    ImprimirCadenas salto
    ImprimirCadenas salto
    ImprimirCadenas salto

    ImprimirCadenas tab
    ImprimirCadenas tab
    ImprimirCadenas Win
    ImprimirCadenas params
    ImprimirCadenas Win2

    AbrirArchivo
    AbrirArchivo3
    Addtextoanterior
    EscribirArchivo salto
    EscribirArchivo params
    EscribirArchivo barra
    getMinSeg2 horaSTRInicio, hora, minuto, segundos
    EscribirArchivo horaSTRInicio
    EscribirArchivo barra2
    EscribirArchivo temp
    CerrarArchivo

    ImprimirCadenas salto
    ImprimirCadenas salto
    ImprimirCadenas salto

    ImprimirCadenas tab
    ImprimirCadenas tab

    PrecioneCualquierTecla
    jmp endJugar
ENDM

ImpFechaHTML MACRO temp, salidaSTR
    ; Obtener la fecha actual
    mov ah, 2Ah                 ; Servicio para obtener la fecha actual
    int 21h                     ; Llamar a la interrupción DOS

    xor ax, ax
    mov bl, 0ah

    mov al, dl
    div bl
    add al, 30h
    add ah, 30h
    mov [salidaSTR], al         ; Guardar decena día
    mov [salidaSTR + 1], ah     ; Guardar unidad día
    mov [salidaSTR + 2], 47

    xor ax, ax

    mov al, dh
    div bl
    add al, 30h
    add ah, 30h
    mov [salidaSTR + 3], al     ; Guardar decena mes
    mov [salidaSTR + 4], ah     ; Guardar unidad mes
    mov [salidaSTR + 5], 47

    mov ax, cx 
    mov dx, 0h
    div bx
    add dl, 30h
    mov [salidaSTR + 9], dl     ; Guardar unidades año
    
    div bl
    add ah, 30h
    mov [salidaSTR + 8], ah     ; Guardar decenas año
    xor ah,ah

    div bl
    add ah, 30h
    mov [salidaSTR + 7], ah     ; Guardar centenas año
    xor ah,ah

    div bl
    add ah, 30h
    mov [salidaSTR + 6], ah     ; Guardar millares año
    xor ah,ah

    mov [salidaSTR + 10], 32

    mov ah, 2Ch       ; Servicio para obtener la hora actual
    int 21h           ; Llamar a la interrupción DOS

    mov bl, 0ah
    xor ax, ax
    mov al, ch        ; Hora actual
    div bl
    add al, 30h
    add ah, 30h
    mov [salidaSTR + 11], al ; Guardar hora
    mov [salidaSTR + 12], ah

    mov [salidaSTR + 13], 58 ; Caracter ':'

    xor ax, ax
    mov al, cl        ; Minutos actuales
    div bl
    add al, 30h
    add ah, 30h
    mov [salidaSTR + 14], al ; Guardar minutos
    mov [salidaSTR + 15], ah 

    mov [salidaSTR + 16], 58 ; Caracter ':'

    xor ax, ax
    mov al, dh        ; Segundos actuales
    div bl
    add al, 30h
    add ah, 30h
    mov [salidaSTR + 17], al ; Guardar segundos
    mov [salidaSTR + 18], ah
    mov [segundos], dh ; Guardar minutos




    EscribirArchivo salidaSTR
ENDM

MACROImprimirReportes MACRO
    LimpiarConsola

    AbrirArchivo
    AbrirArchivo2
    EscribirArchivo encabezado
    EscribirArchivo DatosHTML
    EscribirArchivo FechaDatosHTML
    ImpFechaHTML temp, horaHTML
    EscribirArchivo FechaDatosHTML2
    EscribirArchivo DatosHTML2
    EscribirArchivo DatosHTML3
    EscribirArchivo DatosHTML4
    Addtextoanterior
    EscribirArchivo DatosHTML5
    EscribirArchivo FinHTML
    CerrarArchivo

    ImprimirCadenas salto
    ImprimirCadenas salto
    ImprimirCadenas salto
    ImprimirCadenas tab
    ImprimirCadenas tab
    ImprimirCadenas tab
    ImprimirCadenas HTMLMSG

    ImprimirCadenas salto
    ImprimirCadenas salto

    PrecioneCualquierTecla
ENDM

MACROImprimirPuntajes MACRO 
    LimpiarConsola

    ImprimirCadenas salto
    ImprimirCadenas salto
    ImprimirCadenas salto

    ImprimirCadenas espacio

    ImprimirCadenas Puntajes
    ImprimirCadenas salto

    AbrirArchivo
    borrarDBTEXT
    CerrarArchivo

    ImprimirCadenas dataTXT

    ImprimirCadenas salto

    ImprimirCadenas PrecioneParaContinuar
    obtenerOpcion opcion
ENDM

AbrirArchivo MACRO 
LOCAL file_not_found, read_file
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

AbrirArchivo2 MACRO 
    mov ah, 3Ch  ; Función 3Ch: Crear archivo
    xor cx, cx   ; Atributos de archivo: normal
    lea dx, nombreRP  ; Nombre del archivo
    int 21h      ; Llamar a DOS
    mov filehandle, ax  ; Guardar manejador de archivo
ENDM

AbrirArchivo3 MACRO 
    mov ah, 3Ch  ; Función 3Ch: Crear archivo
    xor cx, cx   ; Atributos de archivo: normal
    lea dx, nombreDB  ; Nombre del archivo
    int 21h      ; Llamar a DOS
    mov filehandle, ax  ; Guardar manejador de archivo
ENDM

EscribirArchivo MACRO params
    mov ah, 40h  ; Función 40h: Escribir en archivo
    mov bx, filehandle  ; Manejador de archivo
    lea dx, params     ; Mensaje a escribir
    mov cx, lengthof params  ; Número de bytes a escribir
    dec cx       ; Excluir el carácter de fin de cadena
    int 21h      ; Llamar a DOS
ENDM

EscribirArchivo2 MACRO params, params2
    mov ah, 40h  ; Función 40h: Escribir en archivo
    mov bx, filehandle  ; Manejador de archivo
    lea dx, params     ; Mensaje a escribir
    mov cx, params2 ; Número de bytes a escribir
    int 21h      ; Llamar a DOS
ENDM

CerrarArchivo MACRO
    mov ah, 3Eh  ; Función 3Eh: Cerrar archivo
    mov bx, filehandle  ; Manejador de archivo
    int 21h      ; Llamar a DOS
ENDM

MACROImprimirTablero MACRO 
    LimpiarConsola
    CleanName
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
    getMinSeg2 horaSTRInicio, hora, minuto, segundos
    CambioTurno

TurnoJugador:
    LimpiarConsola
    PrintTableroYEncabezado Jugador, tablero
    ImprimirCadenas salto

    ObtenerMov Sfila, Scolumna, IndexTab
    validarMOV
    ObtenerMov Ffila, Fcolumna, IndexTab2
    MakeMovimiento tablero

    getMinSeg2 horaSTRInicio, hora, minuto, segundos
    CambioTurno

TurnoIA:
    LimpiarConsola
    PrintTableroYEncabezado Ia, tablero
    ImprimirCadenas salto
    
    ObtenerMov Sfila, Scolumna, IndexTab
    validarMOV
    ObtenerMov Ffila, Fcolumna, IndexTab2
    MakeMovimiento tablero

    JMP Jugar
endJugar:
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
LOCAL InicioCopiaTablero, tableroCopy, tableroOR
    MOV si, 0h

InicioCopiaTablero:
    mov AL, tableroOR[si]
    mov tableroCopy[si], AL
    INC SI

    CMP Si, 40h
    JNE InicioCopiaTablero

    mov [tableroCopy + si], "$"
ENDM

ObtenerMov MACRO fila, columna, destino
    ObtenerFila fila
    ObtenerColumna columna
    MovToInt fila, columna, destino
ENDM

ObtenerFila MACRO valor
    LOCAL inicioDeFila, fin, winp, winI, valorERR
    jmp inicioDeFila
    valorERR:
        ImprimirCadenas salto
        ImprimirCadenas ErrorF

    inicioDeFila:
        ImprimirCadenas salto       ; imprime ingrese fila
        ImprimirCadenas Ifila
        obtenerOpcion valor

        cmp valor, 119
        JE winP

        cmp valor, 87
        JE winI

        CMP valor, 49
        JB valorERR

        CMP valor, 56
        JA valorERR

        jmp fin

    winP:
    EndGame Jugador
    jmp fin

    winI:
    EndGame IA

    fin:
ENDM

ObtenerColumna MACRO valor
    LOCAL InicioColumna, fin, winp, winI, valorERR
    jmp InicioColumna
    valorERR:
        ImprimirCadenas salto
        ImprimirCadenas ErrorC

    InicioColumna:
        ImprimirCadenas salto       ; imprime ingrese columna
        ImprimirCadenas Icolumna
        obtenerOpcion valor

        cmp valor, 119
        JE winP

        cmp valor, 87
        JE winI

        CMP valor, 97
        JB valorERR

        CMP valor, 104
        JA valorERR

        jmp fin

    winP:
    EndGame Jugador
    jmp fin

    winI:
    EndGame IA

    fin:
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

getMinSeg2 MACRO STR, hora, mins, segs
    compararHora hora, mins, segs
    convertirHoraASCII minutosFn, segundosFn, horaSTRInicio
ENDM

getMinSeg MACRO STR, hora, min , segs
    guardarHora hora,  min, segs
    ;convertirHoraASCII min, segs, STR
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

compararHora MACRO horaInicial, minutosInicial, segundosInicial
LOCAL fin, ret1, ret2, ret3, NegativeResult1, NegativeResult2, NegativeResult3
    mov ah, 2Ch       ; Servicio para obtener la hora actual
    int 21h           ; Llamar a la interrupción DOS
    
    xor ax, ax
    mov al, cl
    mov bl, 3ch
    
    mul bl
    mov dl, dh
    xor dh, dh
    add ax, dx  
    
    mov si, ax

    xor ax, ax
    xor bx, bx
    xor cx, cx
    xor dx, dx

    mov dl, minutosInicial[0]
    mov dh, segundosInicial[0]

    mov al, dl
    mov bl, 3ch
    mul bl
    mov dl, dh
    xor dh, dh
    add al, dl

    sub si, ax

    mov ax, si

    xor dx,dx
    div bx

    mov [minutosFn], al  ; Guardar diferencia de minutos
    mov [minutosFn + 1], "$"

    mov [segundosFn], dl  ; Guardar diferencia de segundos
    mov [segundosFn + 1], "$"

fin:
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
        ;mov byte ptr [regBuffer + si], "$"
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