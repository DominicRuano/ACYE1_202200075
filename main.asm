INCLUDE macros.ASM

.MODEL small
.STACK 64h
.DATA
    salto db 10, 13, "$" ; \n
    espacio db " ", "$"
    tab db "    ", "$"
    dosPuntos db ": ", "$"
    mensajeInicio db " Universidad De San Carlos De Guatemala", 10, 13, " Facultad De Ingenieria", 10, 13, " ECYS", "$"
    mensajeMenu db 10, 13, 10, 13, " 1. Nuevo Juego", 10, 13, " 2. Puntajes", 10, 13, " 3. Reportes", 10, 13, " 4. Salir", 10, 13, " >> Ingrese Una Opcion: ", "$"
    opcion db 1 dup(32)
    indicadorColumnas db "  A B C D E F G H", "$"
    indicadorFilas db "12345678", "$"
    tablero db 64 dup(32) ; ROW-MAJOR O COLUMN-MAJOR
    tableroAux db 64 dup(32)
    nombre db ' Por favor, ingrese su nombre: $'
    nombre2 db " El nombre: ", "$"
    nombre3 db " Es correcto? [y/n] ", "$"
    Ia db "IA", "$"
    Tencabezado2 db "   vz   IA     Turno:  ", "$"
    Tencabezado3 db "   Tiempo: ", "$"
    Ifila db " Ingrese la fila: ", "$"
    Icolumna db " Ingrese la Columna: ", "$"
    PrecioneParaContinuar db 10, 13, " Precione cualquier tecla para continuar...  ", "$"
    Puntajes db " Nombre del Jugador | Tiempo ", "$"
    Variable db 10,13, "Var = ", "$"
    nombreDB db "ejemplo.txt", 00h
    nombreRP db "reporte.html", 00h
    encabezado db "<!DOCTYPE html>", 10, 13, "<html>", 10, 13, "<head>", 10, 13, "<title>Reporte</title>", 10, 13, "</head>", 10, 13, "<body>", 10, 13, "<h1>Reporte</h1>",10, 13
    DatosHTML db "<p><strong>Nombre del Curso:</strong> Arquitectura de computadores y ensambladores 1</p>", 10, 13, "<p><strong>Sección:</strong> A</p>", 10, 13, "<p><strong>Nombre del Estudiante:</strong> Dominic Juan Pablo Ruano Perez</p>", 10, 13, "<p><strong>Carnet:</strong> 202200075</p>", 10, 13
    FechaDatosHTML db "<p><strong>Fecha actual: </strong>"
    FechaDatosHTML2 db "</p>", 10, 13
    DatosHTML2 db "<h2>Puntaje de Jugadores</h2>"

    FinHTML db "</body>", 10, 13, "</html>"
    horaHTML db 19 dup("$")
    temp db 1 dup("$")
    fileHandle dw ?
    Jugador db 15 dup("$")
    hora db 2 dup("$")            ; Se usa para la funcion getMinSeg
    horaFn db 2 dup("$")         ; Se usa para la funcion getMinSeg
    minuto db 2 dup("$")          ; Se usa para la funcion getMinSeg
    minutosFn db 2 dup("$")       ; Se usa para la funcion getMinSeg
    segundos db 2 dup("$")        ; Se usa para la funcion getMinSeg
    segundosFn db 2 dup("$")      ; Se usa para la funcion getMinSeg
    horaSTRInicio db 6 dup("$")
    cadenaHora BYTE 3 DUP('$')
    cadenaMinutos BYTE 3 DUP('$')
    cadenaSegundos BYTE 3 DUP('$')
    mensaje BYTE 9 DUP('$')
    Sfila db 2 dup("$")
    Scolumna db 1 dup("$")
    ;horaSTRFinal db 5 dup(0)
    data2TXT db 256 dup("$")
    dataTXT db 256 dup("$")
    bytesRead dw ?
.CODE
    MOV AX, @data
    MOV DS, AX

    ; Metodo Principal (Main)
    Main PROC
        Menu:
            MACROMenu

        ImprimirTablero:
            MACROImprimirTablero
            JMP Menu

        ImprimirPuntajes:
            MACROImprimirPuntajes
            JMP Menu

        ImprimirReportes:
            MACROImprimirReportes
            JMP Menu
        
        Salir:
            ImprimirCadenas salto
            MOV AX, 4C00h ; Interrupcion Para Terminar Programa
            INT 21h
    Main ENDP
END