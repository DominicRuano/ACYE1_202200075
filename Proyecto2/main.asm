INCLUDE macros.ASM

.MODEL small
.STACK 100h
.DATA

    Info1 db "  Arquitectura de computadores y ensambladores 1  A", 10, 13
    Info2 db "  Primer semestre 2024", 10, 13
    Info3 db "  Dominic Juan Pablo Ruano Perez", 10, 13
    Info4 db "  202200075", 10, 13
    Info5 db "  Proyecto 2 Assembler", 10, 13, 10, 13, "$"

    info6 db "  Aun no existe una funcion para genera reportes.", 10, 13, "$"

    colorNegroTexto db 00h ; Negro sobre negro
    colorAzulTexto db 01h ; Azul sobre negro
    colorVerdeTexto db 02h ; Verde sobre negro
    colorCianTexto db 03h ; Cian sobre negro
    colorRojoTexto db 04h ; Rojo sobre negro
    colorMagentaTexto db 05h ; Magenta sobre negro
    colorMarronTexto db 06h ; Marrón sobre negro
    colorGrisClaroTexto db 07h ; Gris claro sobre negro
    colorGrisOscuroTexto db 08h ; Gris oscuro sobre negro
    colorAzulClaroTexto db 09h ; Azul claro sobre negro
    colorVerdeClaroTexto db 0Ah ; Verde claro sobre negro
    colorCianClaroTexto db 0Bh ; Cian claro sobre negro
    colorRojoClaroTexto db 0Ch ; Rojo claro sobre negro
    colorMagentaClaroTexto db 0Dh ; Magenta claro sobre negro
    colorAmarilloTexto db 0Eh ; Amarillo sobre negro
    colorBlancoTexto db 0fh ; Blanco sobre negro

    handlerFile         dw ?
    filename            db 30 dup(32)
    bufferDatos         db 300 dup (?)
    errorCode           db ?
    errorOpenFile       db "Ocurrio Un Error Al Abrir El Archivo - ERRCODE: ", "$"
    errorCloseFile      db "Ocurrio Un Error Al Cerrar El Archivo - ERRCODE: ", "$"
    errorReadFile       db "Ocurrio Un Error Al Leer El CSV - ERRCODE: ", "$"
    errorSizeFile       db "Ocurrio Un Error Obteniendo El Size Del Archivo - ERRCODE: ", "$"
    exitOpenFileMsg     db "El Archivo Se Abrio Correctamente", "$"
    exitCloseFileMsg    db "El Archivo Se Cerro Correctamente", "$"
    exitSizeFileMsg     db "Se Obtuvo La Longitud Correctamente", "$"
    msgToRequestFile    db "Ingrese El Nombre Del Archivo CSV: ", "$"
    msgPromedio         db "El Promedio De Los Datos Es: ", "$"
    msgMaximo           db "El Valor Maximo De Los Datos Es: ", "$"
    msgMinimo           db "El Valor Minimo De Los Datos Es: ", "$"
    msgMediana          db "El Valor De la Mediana De Los Datos Es: ", "$"
    msgContadorDatos    db "El Total De Datos Utilizados Ha Sido De: ", "$"
    msgModa1            db "La Moda De Los Datos Es: ", "$"
    msgModa2            db "Con Una Frecuencia De: ", "$"
    msgEncabezadoTabla  db "-> Valor    -> Frecuencia", "$"
    salto               db 10, 13, "$"
    espacios            db 32, 32, 32, 32, 32, "$"
    numCSV              db 3 dup(?)
    cadenaResult        db 6 dup("$")
    tablaFrecuencias    db 100 dup(?)
    numEntradas         db 1
    indexDatos          dw 0
    extensionArchivo    dw 0
    posApuntador        dw 0
    numDatos            dw 0
    base                dw 10000
    entero              dw ?
    decimal             dw ?
cantDecimal         db 0

    MSGComandoInvalido db "Comando Invalido", 10, 13, "$"
    MSGConsola db 10, 13, "ConsolaPF2> $"
    MSGConsola1 db "    Operacion: $"
    MSGConsola2 db "    Resultado: $"
    Placeholder db "PLACEHOLDER$"
    CAbre db "[$"
    CCierra db "]$"

    opcion db 68 dup("$")
    operacion db 68 dup("$")

.CODE
    MOV AX, @data
    MOV DS, AX

    ; Metodo Principal (Main)
    Main PROC
            LimpiarConsola
        Menu:
            PrintConsola

            jmp Menu

        Salir:
            ;PrintCadena salto
            MOV AX, 4C00h ; Interrupcion Para Terminar Programa
            INT 21h
    Main ENDP

END