INCLUDE macros.ASM

.MODEL small
.STACK 64h
.DATA
    salto db 10, 13, "$" ; \n
    salto2 db 10, "$" ; \n
    espacio db " ", "$"
    tab db "    ", "$"
    dosPuntos db ": ", "$"
    barra db "| ", "$"
    barra2 db "<br>", "$"
    mensajeInicio db " Universidad De San Carlos De Guatemala", 10, 13, " Facultad De Ingenieria", 10, 13, " ECYS", "$"
    mensajeMenu db 10, 13, 10, 13, " 1. Nuevo Juego", 10, 13, " 2. Puntajes", 10, 13, " 3. Reportes", 10, 13, " 4. Salir", 10, 13, " >> Ingrese Una Opcion: ", "$"
    opcion db 1 dup(32)
    indicadorColumnas db "  A B C D E F G H", "$"
    indicadorFilas db "12345678", "$"
    nombre db ' Por favor, ingrese su nombre: $'
    nombre2 db " El nombre: ", "$"
    nombre3 db " Es correcto? [y/n] ", "$"
    Ia db "IA             "
    IA2 db 1 dup("$")
    Tencabezado2 db "   vz   IA     Turno:  ", "$"
    Tencabezado3 db "   Tiempo: ", "$"
    Ifila db " Ingrese la fila: ", "$"
    Icolumna db " Ingrese la Columna: ", "$"
    PrecioneParaContinuar db 10, 13, " Precione cualquier tecla para continuar...  ", "$"
    Win db "El jugador ", "$"
    Win2 db " ha ganado", "$"
    HTMLMSG db "Reporte HTML Generado Correctamente", "$"
    ErrorF db "Ingrese una fila Valida.", "$"
    ErrorC db "Ingrese una columna Valida.", "$"
    Puntajes db " Nombre      | Tiempo ", "$"
    Variable db 10,13, "Var = ", "$"
    nombreDB db "DB.txt", 00h
    nombreRP db "reporte.html", 00h
    encabezado db "<!DOCTYPE html>", 10, 13, "<html>", 10, 13, "<head>", 10, 13, "<title>Reporte</title>", 10, 13, "</head>", 10, 13, "<body>", 10, 13, "<h1>Reporte</h1>",10, 13,10
    DatosHTML db "<p><strong>Nombre del Curso:</strong> Arquitectura de computadores y ensambladores 1</p>", 13, "<p><strong>Sección:</strong> A</p>", 13, "<p><strong>Nombre del Estudiante:</strong> Dominic Juan Pablo Ruano Perez</p>", 13, "<p><strong>Carnet:</strong> 202200075</p>", 10, 13
    FechaDatosHTML db "<p><strong>Fecha actual: </strong> "
    FechaDatosHTML2 db "</p>", 10, 13, 10
    DatosHTML2 db "<h2>Puntaje de Jugadores</h2> ", 10, 13, 10
    DatosHTML3 db "<table border=1>", 13, "<tr>", 13, "    <th><strong>Nombre         | Tiempo</strong> </th>", 13, "</tr>", 10, 13
    DatosHTML4 db "<tr>", 13, "    <td> "
    DatosHTML5 db "</td>", 13, "</tr>", 13, "</table>", 10, 13, 10

    FinHTML db "</body>", 10, 13, "</html> "
    horaHTML db 20 dup("$")
    temp db 2 dup("$")
    fileHandle dw ?
    Jugador db 15 dup(32)
    Jugador2 db 1 dup("$")
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
    espacio2 db 1 dup("$")
    bytesRead dw ?
    tablero db 64 dup(32) ; ROW-MAJOR O COLUMN-MAJOR
    tableroAux db 64 dup(32)
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