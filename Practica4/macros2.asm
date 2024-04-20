

Contador1 MACRO
    mov Contador2, 0ffh
ENDM

NameJ2CPU MACRO
    CleanNameVar Jugador2

    Mov Jugador2[00h], "C"
    Mov Jugador2[01h], "P"
    Mov Jugador2[02h], "U"
ENDM

ValidarWin MACRO
Local empate, fin, salto1, salto2, salto3, salto4, salto5, salto6, salto7, salto8
    xor ax, ax
    xor bx, bx
    xor cx, cx

    dec Contador

    mov al, Tablero[00h]
    mov bl, Tablero[01h]
    mov cl, Tablero[02h]

    cmp al, bl
    jne salto1   ; Saltar si ax no es igual a bx
    cmp bl, cl
    jne salto1   ; Saltar si bx no es igual a cx

    EndGame Turno

salto1:
    mov al, Tablero[03h]
    mov bl, Tablero[04h]
    mov cl, Tablero[05h]

    cmp al, bl
    jne salto2   ; Saltar si ax no es igual a bx
    cmp bl, cl
    jne salto2   ; Saltar si bx no es igual a cx

    EndGame Turno

salto2:
    mov al, Tablero[06h]
    mov bl, Tablero[07h]
    mov cl, Tablero[08h]

    cmp al, bl
    jne salto3   ; Saltar si ax no es igual a bx
    cmp bl, cl
    jne salto3   ; Saltar si bx no es igual a cx

    EndGame Turno

salto3:
    mov al, Tablero[00h]
    mov bl, Tablero[03h]
    mov cl, Tablero[06h]

    cmp al, bl
    jne salto4   ; Saltar si ax no es igual a bx
    cmp bl, cl
    jne salto4   ; Saltar si bx no es igual a cx

    EndGame Turno

salto4:
    mov al, Tablero[01h]
    mov bl, Tablero[04h]
    mov cl, Tablero[07h]

    cmp al, bl
    jne salto5   ; Saltar si ax no es igual a bx
    cmp bl, cl
    jne salto5   ; Saltar si bx no es igual a cx

    EndGame Turno

salto5:
    mov al, Tablero[02h]
    mov bl, Tablero[05h]
    mov cl, Tablero[08h]

    cmp al, bl
    jne salto6   ; Saltar si ax no es igual a bx
    cmp bl, cl
    jne salto6   ; Saltar si bx no es igual a cx

    EndGame Turno

salto6:
    mov al, Tablero[00h]
    mov bl, Tablero[04h]
    mov cl, Tablero[08h]

    cmp al, bl
    jne salto7   ; Saltar si ax no es igual a bx
    cmp bl, cl
    jne salto7   ; Saltar si bx no es igual a cx

    EndGame Turno

salto7:
    mov al, Tablero[02h]
    mov bl, Tablero[04h]
    mov cl, Tablero[06h]

    cmp al, bl
    jne salto8   ; Saltar si ax no es igual a bx
    cmp bl, cl
    jne salto8   ; Saltar si bx no es igual a cx

    EndGame Turno

salto8:
    mov cl, Contador
    cmp cl, 0h
    je empate

    ChangeTurno
    jmp fin

empate:
    LimpiarConsola
    ImprimirCadenasColor WinerEmpate, colorRojoTexto
    PresioneTeclaParaContinuar
    jmp NuevoJuevo

fin:
ENDM

EndGame MACRO params
Local w1, w2
    xor ax, ax
    xor bx, bx

    mov ax, 0003h
    int 10h

    mov al, params
    cmp al, "x"
    je w1
    jmp w2

w1:
    LimpiarConsola

    AbrirArchivo
    AbrirArchivo3
    Addtextoanterior
    EscribirArchivo espacio
    EscribirArchivo espacio
    EscribirArchivo Barra
    ImpFechaDB horaDB
    EscribirArchivo Barra
    EscribirArchivo Jugador1
    EscribirArchivo Barra
    EscribirArchivo Jugador2
    EscribirArchivo Barra
    EscribirArchivo espacio
    EscribirArchivo espacio
    EscribirArchivo espacio
    EscribirArchivo espacio
    EscribirArchivo espacio
    EscribirArchivo espacio
    EscribirArchivo espacio
    EscribirArchivo espacio
    EscribirArchivo espacio
    EscribirArchivo espacio
    EscribirArchivo espacio
    EscribirArchivo espacio
    EscribirArchivo Barra
    EscribirArchivo Jugador1
    EscribirArchivo Barra
    EscribirArchivo Jugador2
    EscribirArchivo Barra
    EscribirArchivo Salto
    CerrarArchivo

    ImprimirCadenasColor Winer, colorRojoTexto
    ImprimirCadenasColor Jugador1, colorVerdeClaroTexto
    PresioneTeclaParaContinuar
    jmp NuevoJuevo

w2:
    LimpiarConsola

    ;AbrirArchivo
    ;AbrirArchivo3
    ;Addtextoanterior
    ;EscribirArchivo espacio
    ;EscribirArchivo espacio
    ;EscribirArchivo Barra
    ;ImpFechaDB horaDB
    ;EscribirArchivo Barra
    ;EscribirArchivo Jugador1
    ;EscribirArchivo Barra
    ;EscribirArchivo Jugador2
    ;EscribirArchivo Barra
    ;EscribirArchivo espacio
    ;EscribirArchivo espacio
    ;EscribirArchivo espacio
    ;EscribirArchivo espacio
    ;EscribirArchivo espacio
    ;EscribirArchivo espacio
    ;EscribirArchivo espacio
    ;EscribirArchivo espacio
    ;EscribirArchivo espacio
    ;EscribirArchivo espacio
    ;EscribirArchivo espacio
    ;EscribirArchivo espacio
    ;EscribirArchivo Barra
    ;EscribirArchivo Jugador2
    ;EscribirArchivo Barra
    ;EscribirArchivo Jugador1
    ;EscribirArchivo Barra
    ;EscribirArchivo Salto
    ;CerrarArchivo

    ImprimirCadenasColor Winer, colorRojoTexto
    ImprimirCadenasColor Jugador2, colorVerdeClaroTexto
    PresioneTeclaParaContinuar
    jmp NuevoJuevo

ENDM

ImpFechaDB MACRO salidaSTR
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
    mov [salidaSTR + 7], dl     ; Guardar unidades año
    
    div bl
    add ah, 30h
    mov [salidaSTR + 6], ah     ; Guardar decenas año
    xor ah,ah

    mov [salidaSTR + 8], "|"

    mov ah, 2Ch       ; Servicio para obtener la hora actual
    int 21h           ; Llamar a la interrupción DOS

    mov bl, 0ah
    xor ax, ax
    mov al, ch        ; Hora actual
    div bl
    add al, 30h
    add ah, 30h
    mov [salidaSTR + 9], al ; Guardar hora
    mov [salidaSTR + 10], ah

    mov [salidaSTR + 11], 58 ; Caracter ':'

    xor ax, ax
    mov al, cl        ; Minutos actuales
    div bl
    add al, 30h
    add ah, 30h
    mov [salidaSTR + 12], al ; Guardar minutos
    mov [salidaSTR + 13], ah 

    mov [salidaSTR + 14], 58 ; Caracter ':'

    xor ax, ax
    mov al, dh        ; Segundos actuales
    div bl
    add al, 30h
    add ah, 30h
    mov [salidaSTR + 15], al ; Guardar segundos
    mov [salidaSTR + 16], ah
    mov [segundos], dh ; Guardar minutos

    EscribirArchivo salidaSTR
ENDM

CerrarArchivo MACRO
    mov ah, 3Eh  ; Función 3Eh: Cerrar archivo
    mov bx, filehandle  ; Manejador de archivo
    int 21h      ; Llamar a DOS
ENDM

EscribirArchivo MACRO params
    mov ah, 40h  ; Función 40h: Escribir en archivo
    mov bx, filehandle  ; Manejador de archivo
    lea dx, params     ; Mensaje a escribir
    mov cx, lengthof params  ; Número de bytes a escribir
    dec cx       ; Excluir el carácter de fin de cadena
    int 21h      ; Llamar a DOS
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

EscribirArchivo2 MACRO params, params2
    mov ah, 40h  ; Función 40h: Escribir en archivo
    mov bx, filehandle  ; Manejador de archivo
    lea dx, params     ; Mensaje a escribir
    mov cx, params2 ; Número de bytes a escribir
    int 21h      ; Llamar a DOS
ENDM

AbrirArchivo3 MACRO 
    mov ah, 3Ch  ; Función 3Ch: Crear archivo
    xor cx, cx   ; Atributos de archivo: normal
    lea dx, nombreDB  ; Nombre del archivo
    int 21h      ; Llamar a DOS
    mov filehandle, ax  ; Guardar manejador de archivo
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

InicializarContador MACRO
    mov Contador, 09h
ENDM

GetMov MACRO
    obtenerMovNum PosX
    obtenerMovDP opcion
    obtenerMovNum PosY
ENDM

GetMov2 MACRO
    generateRandomNumber PosX
    generateRandomNumber PosY
ENDM

EscribirMov MACRO params
Local salto1, salto2, fin
    xor ax, ax
    xor bx, bx
    
    mov al, PosX
    mov bl, PosY
    sub al, 30h
    sub bl, 30h

    dec al
    mov cl, 03h
    mul cl
    add al, bl
    dec al
    mov ah, 0h
    mov si, ax
    mov cl, params

    cmp Tablero[si], "o"
    je salto1

    cmp Tablero[si], "x"
    je salto2

    mov Tablero[si], cl
    jmp fin

salto1:
    cmp Turno, "o"
    je Turnoj2

    Jmp TurnoJ1

salto2:
    cmp Turno, "o"
    je Turnoj2

    Jmp TurnoJ1

fin:
ENDM

EscribirMov2 MACRO params
Local salto1, salto2, fin, movFake
    xor ax, ax
    xor bx, bx
    
    mov al, PosX
    mov bl, PosY
    sub al, 30h
    sub bl, 30h

    dec al
    mov cl, 03h
    mul cl
    add al, bl
    dec al
    mov ah, 0h
    mov si, ax
    mov cl, params

    cmp Tablero[si], "o"
    je salto1

    cmp Tablero[si], "x"
    je salto2

    mov Tablero[si], cl
    jmp fin

salto1:
    dec Contador2

    cmp Contador2, 0h
    je movFake

    cmp Turno, "o"
    je GMovs2

    Jmp TurnoJ1CPU

salto2:
    dec Contador2

    cmp Contador2, 0h
    je movFake

    cmp Turno, "o"
    je GMovs2

    Jmp TurnoJ1CPU

movFake:
    FAkemov

fin:
ENDM

FAkemov MACRO
Local Inicio, incre, fin
    xor ax, ax
    xor bx, bx

    mov si, 0h
Inicio:
    cmp Tablero[si], "o"
    je incre

    cmp Tablero[si], "x"
    je incre

    mov Tablero[si], "o"
    jmp MMov2


incre:
    inc si
    jmp Inicio

fin:
ENDM

CleanTab MACRO
    mov Tablero[00h], 1
    mov Tablero[01h], 2
    mov Tablero[02h], 3
    mov Tablero[03h], 4
    mov Tablero[04h], 5
    mov Tablero[05h], 6
    mov Tablero[06h], 7
    mov Tablero[07h], 8
    mov Tablero[08h], 9
ENDM

ChangeTurno MACRO
Local cambio, fin
    cmp Turno, "o"
    je cambio

    mov Turno, "o"
    jmp fin

cambio:
    mov Turno, "x"
    jmp fin
fin:
ENDM

PrintTablero MACRO 
Local Inicio, fin, equis, circulo, equis1, equis2, equis3, equis4, equis5, equis6, equis7, equis8, equis9, circulo1, circulo2, circulo3, circulo4, circulo5, circulo6, circulo7, circulo8, circulo9, val1, val2, val3
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


    DrawSprite String, 00h, 00h, 30h, 08h
    DrawSprite String2, 030h, 00h, 30h, 08h
    DrawSprite String3, 060h, 00h, 30h, 08h
    DrawSprite String4, 092h, 00h, 05h, 08h

    cmp Turno, "o"
    je val1

    jmp val2

val1:
    DrawSprite barrao_uno, 68h, 28h, 8h, 8h
    DrawSprite barrao_dos, 68h, 30h, 8h, 8h
    DrawSprite barrao_tres, 70h, 28h, 8h, 8h
    DrawSprite barrao_cuatro, 70h, 30h, 8h, 8h
    jmp val3

val2:
    DrawSprite barrax_uno, 68h, 28h, 8h, 8h
    DrawSprite barrax_dos, 68h, 30h, 8h, 8h
    DrawSprite barrax_dos, 70h, 28h, 8h, 8h
    DrawSprite barrax_uno, 70h, 30h, 8h, 8h

val3:
    mov si, 0h
Inicio:
    cmp si, 08h
    ja fin

    cmp Tablero[si], "o" ;51
    je circulo

    cmp Tablero[si], "x"
    je equis

    inc si


    jmp Inicio

circulo:
    mov ax, si
    inc si

    cmp ax, 00h
    je circulo1

    cmp ax, 01h
    je circulo2

    cmp ax, 02h
    je circulo3

    cmp ax, 03h
    je circulo4

    cmp ax, 04h
    je circulo5

    cmp ax, 05h
    je circulo6

    cmp ax, 06h
    je circulo7

    cmp ax, 07h
    je circulo8

    cmp ax, 08h
    jmp circulo9

circulo1:
    DrawSprite barrao_uno, 08h, 10h, 8h, 8h
    DrawSprite barrao_dos, 08h, 18h, 8h, 8h
    DrawSprite barrao_tres, 10h, 10h, 8h, 8h
    DrawSprite barrao_cuatro, 10h, 18h, 8h, 8h
    jmp Inicio

circulo2:
    DrawSprite barrao_uno, 20h, 10h, 8h, 8h
    DrawSprite barrao_dos, 20h, 18h, 8h, 8h
    DrawSprite barrao_tres, 28h, 10h, 8h, 8h
    DrawSprite barrao_cuatro, 28h, 18h, 8h, 8h
    jmp Inicio

circulo3:
    DrawSprite barrao_uno, 38h, 10h, 8h, 8h
    DrawSprite barrao_dos, 38h, 18h, 8h, 8h
    DrawSprite barrao_tres, 40h, 10h, 8h, 8h
    DrawSprite barrao_cuatro, 40h, 18h, 8h, 8h
    jmp Inicio

circulo4:
    DrawSprite barrao_uno, 08h, 28h, 8h, 8h
    DrawSprite barrao_dos, 08h, 30h, 8h, 8h
    DrawSprite barrao_tres, 10h, 28h, 8h, 8h
    DrawSprite barrao_cuatro, 10h, 30h, 8h, 8h
    jmp Inicio

circulo5:
    DrawSprite barrao_uno, 20h, 28h, 8h, 8h
    DrawSprite barrao_dos, 20h, 30h, 8h, 8h
    DrawSprite barrao_tres, 28h, 28h, 8h, 8h
    DrawSprite barrao_cuatro, 28h, 30h, 8h, 8h
    jmp Inicio

circulo6:
    DrawSprite barrao_uno, 38h, 28h, 8h, 8h
    DrawSprite barrao_dos, 38h, 30h, 8h, 8h
    DrawSprite barrao_tres, 40h, 28h, 8h, 8h
    DrawSprite barrao_cuatro, 40h, 30h, 8h, 8h
    jmp Inicio

circulo7:
    DrawSprite barrao_uno, 08h, 40h, 8h, 8h
    DrawSprite barrao_dos, 08h, 48h, 8h, 8h
    DrawSprite barrao_tres, 10h, 40h, 8h, 8h
    DrawSprite barrao_cuatro, 10h, 48h, 8h, 8h
    jmp Inicio

circulo8:
    DrawSprite barrao_uno, 20h, 40h, 8h, 8h
    DrawSprite barrao_dos, 20h, 48h, 8h, 8h
    DrawSprite barrao_tres, 28h, 40h, 8h, 8h
    DrawSprite barrao_cuatro, 28h, 48h, 8h, 8h
    jmp Inicio

circulo9:
    DrawSprite barrao_uno, 38h, 40h, 8h, 8h
    DrawSprite barrao_dos, 38h, 48h, 8h, 8h
    DrawSprite barrao_tres, 40h, 40h, 8h, 8h
    DrawSprite barrao_cuatro, 40h, 48h, 8h, 8h
    jmp Inicio

equis:
    mov ax, si
    inc si

    cmp ax, 00h
    je equis1

    cmp ax, 01h
    je equis2

    cmp ax, 02h
    je equis3

    cmp ax, 03h
    je equis4

    cmp ax, 04h
    je equis5

    cmp ax, 05h
    je equis6

    cmp ax, 06h
    je equis7

    cmp ax, 07h
    je equis8

    cmp ax, 08h
    jmp equis9

equis1:
    DrawSprite barrax_uno, 08h, 10h, 8h, 8h
    DrawSprite barrax_dos, 08h, 18h, 8h, 8h
    DrawSprite barrax_dos, 10h, 10h, 8h, 8h
    DrawSprite barrax_uno, 10h, 18h, 8h, 8h
    jmp Inicio

equis2:
    DrawSprite barrax_uno, 20h, 10h, 8h, 8h
    DrawSprite barrax_dos, 20h, 18h, 8h, 8h
    DrawSprite barrax_dos, 28h, 10h, 8h, 8h
    DrawSprite barrax_uno, 28h, 18h, 8h, 8h
    jmp Inicio

equis3:
    DrawSprite barrax_uno, 38h, 10h, 8h, 8h
    DrawSprite barrax_dos, 38h, 18h, 8h, 8h
    DrawSprite barrax_dos, 40h, 10h, 8h, 8h
    DrawSprite barrax_uno, 40h, 18h, 8h, 8h
    jmp Inicio

equis4:
    DrawSprite barrax_uno, 08h, 28h, 8h, 8h
    DrawSprite barrax_dos, 08h, 30h, 8h, 8h
    DrawSprite barrax_dos, 10h, 28h, 8h, 8h
    DrawSprite barrax_uno, 10h, 30h, 8h, 8h
    jmp Inicio

equis5:
    DrawSprite barrax_uno, 20h, 28h, 8h, 8h
    DrawSprite barrax_dos, 20h, 30h, 8h, 8h
    DrawSprite barrax_dos, 28h, 28h, 8h, 8h
    DrawSprite barrax_uno, 28h, 30h, 8h, 8h
    jmp Inicio

equis6:
    DrawSprite barrax_uno, 38h, 28h, 8h, 8h
    DrawSprite barrax_dos, 38h, 30h, 8h, 8h
    DrawSprite barrax_dos, 40h, 28h, 8h, 8h
    DrawSprite barrax_uno, 40h, 30h, 8h, 8h
    jmp Inicio

equis7:
    DrawSprite barrax_uno, 08h, 40h, 8h, 8h
    DrawSprite barrax_dos, 08h, 48h, 8h, 8h
    DrawSprite barrax_dos, 10h, 40h, 8h, 8h
    DrawSprite barrax_uno, 10h, 48h, 8h, 8h
    jmp Inicio

equis8:
    DrawSprite barrax_uno, 20h, 40h, 8h, 8h
    DrawSprite barrax_dos, 20h, 48h, 8h, 8h
    DrawSprite barrax_dos, 28h, 40h, 8h, 8h
    DrawSprite barrax_uno, 28h, 48h, 8h, 8h
    jmp Inicio

equis9:
    DrawSprite barrax_uno, 38h, 40h, 8h, 8h
    DrawSprite barrax_dos, 38h, 48h, 8h, 8h
    DrawSprite barrax_dos, 40h, 40h, 8h, 8h
    DrawSprite barrax_uno, 40h, 48h, 8h, 8h
    jmp Inicio


    ;DrawSprite barrax_uno, 08h, 10h, 8h, 8h
    ;DrawSprite barrax_dos, 08h, 18h, 8h, 8h
    ;DrawSprite barrax_dos, 10h, 10h, 8h, 8h
    ;DrawSprite barrax_uno, 10h, 18h, 8h, 8h

    ;DrawSprite barrao_uno, 20h, 28h, 8h, 8h
    ;DrawSprite barrao_dos, 20h, 30h, 8h, 8h
    ;DrawSprite barrao_tres, 28h, 28h, 8h, 8h
    ;DrawSprite barrao_cuatro, 28h, 30h, 8h, 8h
fin:
ENDM

Sleep MACRO params
    mov cx, params ; tiempo de espera alto
    mov dx, 0          ; tiempo de espera bajo
    mov ah, 86h        ; función de espera del BIOS
    int 15h            ; llama a la interrupción del BIOS
ENDM

Sleep2 MACRO params
    mov cx, 0 ; tiempo de espera alto
    mov dx, params          ; tiempo de espera bajo
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
    add ax, x               ; AX = 320 * Y + X
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
    CleanNameVar Player
    ImprimirCadenas salto

    ImprimirCadenasColor String, colorAmarilloTexto
    obtenerString Player, 10
    
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

CleanNameVar MACRO params
LOCAL Inicio
    mov si, 0h
Inicio:
    mov params[si], 32
    inc si

    cmp si, 0Ah
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

obtenerMovDP MACRO regOpcion
LOCAL repeat, fin
repeat:
        MOV AH, 08h         ; Función para leer un carácter sin eco
        INT 21h             ; Llama a la interrupción de DOS

        CMP AL, ":"         ; Compara el carácter ingresado con el carácter válido
        JE fin              ; Si son iguales, salta a la etiqueta 1

        JMP repeat          ; Si no son iguales, repite el bucle
fin:
    MOV regOpcion, AL     ; Almacena el carácter válido en el registro especificado
    ImprimirCadenas regOpcion
ENDM

obtenerMovNum MACRO regOpcion
LOCAL repeat, fin
repeat:
        MOV AH, 08h         ; Función para leer un carácter sin eco
        INT 21h             ; Llama a la interrupción de DOS

        CMP AL, "1"         ; Compara el carácter ingresado con el carácter válido
        JE fin              ; Si son iguales, salta a la etiqueta 1

        CMP AL, "2"         ; Compara el carácter ingresado con el carácter válido
        JE fin              ; Si son iguales, salta a la etiqueta 1

        CMP AL, "3"         ; Compara el carácter ingresado con el carácter válido
        JE fin              ; Si son iguales, salta a la etiqueta 1

        JMP repeat          ; Si no son iguales, repite el bucle
fin:
    MOV regOpcion, AL     ; Almacena el carácter válido en el registro especificado
    ImprimirCadenas regOpcion
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

generateRandomNumber MACRO numVar
LOCAL skip
    ; Inicialización del generador de números aleatorios
skip:
    mov ah, 2Ch     
    int 21h         ; obtiene la fecha y la hora del sistema.

    xor dx, dx      ; Limpia el registro dx estableciéndolo en 0.

    mov ah, 0       ; Establece el valor de ah en 0. Esta es una función de la interrupción 1Ah que obtiene el contador de tiempo del sistema.
    int 1Ah         ; Llama a la interrupción 1Ah, que es la interrupción de BIOS. En este caso, obtiene el contador de tiempo del sistema.

    and dx, 3       ; Realiza una operación AND bit a bit en dx y 3. Esto tiene el efecto de limitar dx al rango 0-3, lo que es útil para generar un número aleatorio en el rango.

    cmp dl, 0       ; Compara dl con 0.
    je skip         ; Si dl es igual a 0, salta a la etiqueta skip.

    add dl, 30h

    mov numVar, dl  ; Mueve el valor de dl (la parte baja de dx) a numVar. Esto almacena el número aleatorio generado en numVar.
ENDM


