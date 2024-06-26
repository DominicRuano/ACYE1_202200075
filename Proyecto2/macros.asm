
PrintConsola MACRO
    PrintCadena MSGConsola
    obtenerString opcion, 40h
    PrintCadena salto

    GetComando

ENDM

comando MACRO params, params2
    PrintCadena MSGConsola1
    PrintCadena params
    PrintCadena salto

    PrintCadena MSGConsola2
    PrintCadena espacio
    PrintCadena CAbre
    PrintCadena params2
    PrintCadena CCierra
    PrintCadena salto
ENDM

GetComando MACRO
LOCAL comando1, comando2, comando3, comando4, comando5, comando6, comando7, comando8, comando9, comando10, comando11
    cmp opcion[0], "s"
    jne comando1

    cmp opcion[1], "a"
    jne comando1

    cmp opcion[2], "l"
    jne comando1

    cmp opcion[3], "i"
    jne comando1

    cmp opcion[4], "r"
    jne comando1

    jmp Salir

comando1:
    cmp opcion[0], "i"
    jne comando2

    cmp opcion[1], "n"
    jne comando2

    cmp opcion[2], "f"
    jne comando2

    cmp opcion[3], "o"
    jne comando2

    PrintCadena Info1

    jmp Menu

comando2:
    cmp opcion[0], "r"
    jne comando3

    cmp opcion[1], "e"
    jne comando3

    cmp opcion[2], "p"
    jne comando3

    cmp opcion[3], "o"
    jne comando3

    cmp opcion[4], "r"
    jne comando3

    cmp opcion[5], "t"
    jne comando3

    cmp opcion[6], "e"
    jne comando3

    cmp BooleanValor[0], "0"
    je bool

    ImpFechaHora

    AbrirArchivo3
    EscribirArchivo StrToPrint1

    ; * Mediana
    MOV base, 10000
    Mediana
    EscribirArchivo cadenaResult

    EscribirArchivo salto
    EscribirArchivo StrToPrint2

    ; * Promedio
    MOV base, 10000
    Promedio
    EscribirArchivo cadenaResult

    Moda2

    EscribirArchivo salto
    EscribirArchivo StrToPrint4

    ; * Maximo
    MOV base, 10000
    Maximo
    EscribirArchivo cadenaResult

    EscribirArchivo salto
    EscribirArchivo StrToPrint5

    ; * Minimo
    MOV base, 10000
    Minimo
    EscribirArchivo2 cadenaResult

    MOV base, 10000

    EscribirArchivo salto
    EscribirArchivo StrToPrint6
    EscribirArchivo salto
    EscribirArchivo StrToPrint7

    PrintTablaFrecuencias

    EscribirArchivo salto
    EscribirArchivo StrToPrint8
    EscribirArchivo fecha
    EscribirArchivo salto
    EscribirArchivo StrToPrint9
    EscribirArchivo hora
    EscribirArchivo salto
    EscribirArchivo StrToPrint10
    EscribirArchivo salto
    EscribirArchivo StrToPrint11
    CerrarArchivo

    PrintCadena StrToPrint12

    jmp Menu

comando3:
    cmp opcion[0], "l"
    jne comando4

    cmp opcion[1], "i"
    jne comando4

    cmp opcion[2], "m"
    jne comando4

    cmp opcion[3], "p"
    jne comando4

    cmp opcion[4], "i"
    jne comando4

    cmp opcion[5], "a"
    jne comando4

    cmp opcion[6], "r"
    jne comando4

    LimpiarConsola

    jmp Menu

comando4:
    cmp opcion[0], "a"
    jne comando5

    cmp opcion[1], "b"
    jne comando5

    cmp opcion[2], "r"
    jne comando5

    cmp opcion[3], "i"
    jne comando5

    cmp opcion[4], "r"
    jne comando5

    cmp opcion[5], "_"
    jne comando5

    CleanAgain?

    mov BooleanValor[0], "1"

    CleanNameCSV

    OpenFile
    GetSizeFile handlerFile
    ReadCSV handlerFile, numCSV
    CloseFile handlerFile

    ; * Ordenar Datos - Ordenamiento Burbuja
    OrderData

    ; * Construir Tabla De Frecuencias
    BuildTablaFrecuencias
    OrderFrecuencies
    MOV base, 10000

    PrintCadena exitOpenFileMsg
    PrintCadena salto

    jmp Menu

comando5:
    cmp opcion[0], "c"
    jne comando6

    cmp opcion[1], "o"
    jne comando6

    cmp opcion[2], "n"
    jne comando6

    cmp opcion[3], "t"
    jne comando6

    cmp opcion[4], "a"
    jne comando6

    cmp opcion[5], "d"
    jne comando6

    cmp opcion[6], "o"
    jne comando6

    cmp opcion[7], "r"
    jne comando6

    cmp BooleanValor[0], "0"
    je bool

    ; * Contador De Datos
    ContadorDatos
    MOV base, 10000

    jmp Menu

comando6:
    cmp opcion[0], "m"
    jne comando7

    cmp opcion[1], "i"
    jne comando7

    cmp opcion[2], "n"
    jne comando7

    cmp BooleanValor[0], "0"
    je bool

    ; * Minimo
    Minimo
    comando Placeholder2, cadenaResult
    MOV base, 10000

    jmp Menu

comando7:
    cmp opcion[0], "m"
    jne comando8

    cmp opcion[1], "a"
    jne comando8

    cmp opcion[2], "x"
    jne comando8

    cmp BooleanValor[0], "0"
    je bool

    ; * Maximo
    Maximo
    comando Placeholder1, cadenaResult
    MOV base, 10000

    jmp Menu

comando8:
    cmp opcion[0], "m"
    jne comando9

    cmp opcion[1], "o"
    jne comando9

    cmp opcion[2], "d"
    jne comando9

    cmp opcion[3], "a"
    jne comando9

    cmp BooleanValor[0], "0"
    je bool

    PrintCadena MSGConsola1
    PrintCadena Placeholder3
    PrintCadena salto

    ; * Moda
    Moda
    MOV base, 10000

    jmp Menu

comando9:
    cmp opcion[0], "m"
    jne comando10

    cmp opcion[1], "e"
    jne comando10

    cmp opcion[2], "d"
    jne comando10

    cmp opcion[3], "i"
    jne comando10

    cmp opcion[4], "a"
    jne comando10

    cmp opcion[5], "n"
    jne comando10

    cmp opcion[6], "a"
    jne comando10

    cmp BooleanValor[0], "0"
    je bool

    ; * Mediana
    Mediana
    comando Placeholder4, cadenaResult
    MOV base, 10000

    jmp Menu

comando10:
    cmp opcion[0], "p"
    jne comando11

    cmp opcion[1], "r"
    jne comando11

    cmp opcion[2], "o"
    jne comando11

    cmp opcion[3], "m"
    jne comando11

    cmp BooleanValor[0], "0"
    je bool

    ; * Promedio
    Promedio
    comando Placeholder5, cadenaResult
    MOV base, 10000

    jmp Menu

comando11:
    cmp opcion[0], "g"
    jne comando12

    cmp opcion[1], "r"
    jne comando12

    cmp opcion[2], "a"
    jne comando12

    cmp opcion[3], "f"
    jne comando12

    cmp opcion[4], "_"
    jne comando12

    cmp opcion[5], "b"
    jne comando12

    cmp opcion[6], "a"
    jne comando12

    cmp opcion[7], "r"
    jne comando12

    cmp opcion[8], "r"
    jne comando12

    cmp opcion[9], "a"
    jne comando12

    cmp opcion[10], "_"
    jne comando12

    cmp opcion[11], "a"
    jne comando12

    cmp opcion[12], "s"
    jne comando12

    cmp opcion[13], "c"
    jne comando12

    cmp BooleanValor[0], "0"
    je bool

    printGraf

    obtenerOpcion opcion2
    LimpiarConsola

    jmp Menu

comando12:
    cmp opcion[0], "g"
    jne comando13

    cmp opcion[1], "r"
    jne comando13

    cmp opcion[2], "a"
    jne comando13

    cmp opcion[3], "f"
    jne comando13

    cmp opcion[4], "_"
    jne comando13

    cmp opcion[5], "b"
    jne comando13

    cmp opcion[6], "a"
    jne comando13

    cmp opcion[7], "r"
    jne comando13

    cmp opcion[8], "r"
    jne comando13

    cmp opcion[9], "a"
    jne comando13

    cmp opcion[10], "_"
    jne comando13

    cmp opcion[11], "d"
    jne comando13

    cmp opcion[12], "e"
    jne comando13

    cmp opcion[13], "s"
    jne comando13   

    cmp opcion[14], "c"
    jne comando13

    cmp BooleanValor[0], "0"
    je bool

    printGraf

    obtenerOpcion opcion2
    LimpiarConsola

    jmp Menu

comando13:

    cmp opcion[0], "g"
    jne comando14

    cmp opcion[1], "r"
    jne comando14

    cmp opcion[2], "a"
    jne comando14

    cmp opcion[3], "f"
    jne comando14

    cmp opcion[4], "_"
    jne comando14

    cmp opcion[5], "l"
    jne comando14

    cmp opcion[6], "i"
    jne comando14

    cmp opcion[7], "n"
    jne comando14

    cmp opcion[8], "e"
    jne comando14

    cmp opcion[9], "a"
    jne comando14

    cmp BooleanValor[0], "0"
    je bool

    printGraf
    obtenerOpcion opcion2
    LimpiarConsola

    jmp Menu

comando14:

    PrintCadena MSGComandoInvalido
    jmp Menu


ENDM

PrintCadena MACRO cadena
    MOV AH, 09h
    LEA DX, cadena
    INT 21h
ENDM

OpenFile MACRO
    LOCAL ErrorToOpen, ExitOpenFile
    MOV AL, 2
    MOV DX, OFFSET opcion + 6
    MOV AH, 3Dh
    INT 21h

    JC ErrorToOpen

    MOV handlerFile, AX
    ;PrintCadena salto
    ;PrintCadena exitOpenFileMsg
    JMP ExitOpenFile

    ErrorToOpen:
        MOV errorCode, AL
        ADD errorCode, 48

        PrintCadena errorOpenFile

        MOV AH, 02h
        MOV DL, errorCode
        INT 21h
        jmp Menu

    ExitOpenFile:
ENDM

CloseFile MACRO handler
    LOCAL ErrorToClose, ExitCloseFile
    MOV AH, 3Eh
    MOV BX, handler
    INT 21h

    JC ErrorToClose

    ;PrintCadena salto
    ;PrintCadena exitCloseFileMsg
    JMP ExitCloseFile

    ErrorToClose:
        MOV errorCode, AL
        ADD errorCode, 48

        PrintCadena salto
        PrintCadena errorCloseFile

        MOV AH, 02h
        MOV DL, errorCode
        INT 21h
    
    ExitCloseFile:
ENDM

ReadCSV MACRO handler, buffer
    LOCAL LeerByte, ErrorReadCSV, ExitReadCSV

    MOV BX, handler
    MOV CX, 1
    MOV DX, OFFSET buffer

    LeerByte:
        MOV AX, 3F00h
        INT 21h

        JC ErrorReadCSV

        INC DX
        MOV SI, DX
        SUB SI, 1

        SUB SI, OFFSET buffer

        CMP buffer[SI], 2Ch
        JNE LeerByte
        
        PUSH BX
        ConvertirNumero
        MOV DX, OFFSET buffer

        PUSH CX
        PUSH DX

        obtenerPosApuntador handler, 1, posApuntador

        POP DX
        POP CX
        POP BX
        MOV AX, posApuntador

        CMP extensionArchivo, AX
        JBE ExitReadCSV
        JMP LeerByte

    ErrorReadCSV:
        MOV errorCode, AL
        ADD errorCode, 48

        PrintCadena salto
        PrintCadena errorReadFile

        MOV AH, 02h
        MOV DL, errorCode
        INT 21h

    ExitReadCSV:
ENDM

ConvertirNumero MACRO
    LOCAL DosDigitosNum, FinConvertirNumero
    XOR AX, AX
    XOR BX, BX

    MOV DI, 0
    CMP SI, 2
    JNE UnDigitoNum

    DosDigitosNum:
        MOV AL, numCSV[DI]
        SUB AL, 48
        MOV BL, 10
        MUL BL
        INC DI

    UnDigitoNum:
        MOV BL, numCSV[DI]
        SUB BL, 48
        ADD AL, BL

    FinConvertirNumero:
        XOR BX, BX
        MOV BX, indexDatos
        MOV bufferDatos[BX], AL
        INC BX
        MOV indexDatos, BX

        MOV BX, numDatos
        INC BX
        MOV numDatos, BX
ENDM

GetSizeFile MACRO handler
    LOCAL ErrorGetSize, ExitGetSize
    obtenerPosApuntador handler, 2, extensionArchivo
    JC ErrorGetSize

    MOV extensionArchivo, AX
    obtenerPosApuntador handler, 0, posApuntador
    JC ErrorGetSize

    ;PrintCadena salto
    ;PrintCadena exitSizeFileMsg
    JMP ExitGetSize

    ErrorGetSize:
        MOV errorCode, AL
        ADD errorCode, 48

        PrintCadena salto
        PrintCadena errorSizeFile

        MOV AH, 02h
        MOV DL, errorCode
        INT 21h

    ExitGetSize:
ENDM

obtenerPosApuntador MACRO handler, posActual, bufferPos
    MOV AH, 42h
    MOV AL, posActual
    MOV BX, handler
    MOV CX, 0
    MOV DX, 0
    INT 21h

    MOV bufferPos, AX
ENDM

PedirCadena MACRO buffer
    LEA DX, buffer
    MOV AH, 0Ah
    INT 21h

    XOR BX, BX
    MOV SI, 2
    MOV BL, filename[1]
    ADD SI, BX
    MOV filename[SI], 0
ENDM

OrderData MACRO
    LOCAL for1, for2, Intercambio, terminarFor2
    XOR AX, AX
    XOR CX, CX
    XOR DX, DX

    MOV CX, numDatos
    DEC CX
    MOV DL, 0
    for1:
        PUSH CX

        MOV CX, numDatos
        DEC CX
        SUB CX, DX
        MOV BX, 0
        for2:
            MOV AL, bufferDatos[BX]
            MOV AH, bufferDatos[BX + 1]
            CMP AL, AH
            JA Intercambio
            INC BX
            LOOP for2
            JMP terminarFor2

            Intercambio:
                XCHG AL, AH
                MOV bufferDatos[BX], AL
                MOV bufferDatos[BX + 1], AH
                INC BX

            LOOP for2

        terminarFor2:
            POP CX
            INC DL
            LOOP for1
ENDM

Promedio MACRO
    LOCAL Sumatoria, CicloDecimal, ContinuarProm
    XOR AX, AX
    XOR BX, BX
    XOR CX, CX
    XOR DX, DX

    MOV CX, numDatos
    Sumatoria:
        MOV DL, bufferDatos[BX]
        ADD AX, DX
        INC BX
        MOV DX, 0
        LOOP Sumatoria
    
    MOV DX, 0
    MOV BX, numDatos
    DIV BX
    MOV entero, AX
    MOV decimal, DX
    MOV SI, 0

    CrearCadena entero, cadenaResult

    MOV cadenaResult[SI], 46
    INC SI

    CMP decimal, 0
    JNE CicloDecimal

    MOV cadenaResult[SI], 48
    INC SI
    MOV cadenaResult[SI], 48
    JMP ContinuarProm

    CicloDecimal:
        MOV AX, decimal
        MOV BX, 10
        MOV DX, 0
        MUL BX

        MOV BX, numDatos
        MOV DX, 0
        DIV BX

        MOV decimal, DX
        MOV entero, AX
        CrearCadena entero, cadenaResult
        MOV AL, cantDecimal
        INC AL
        MOV cantDecimal, AL
        CMP AL, 2
        JNE CicloDecimal

    ContinuarProm:
        MOV cantDecimal, 0
ENDM

CrearCadena MACRO valor, cadena
    LOCAL CICLO, DIVBASE, SALIRCC, ADDZERO, ADDZERO2

    CICLO:
        MOV DX, 0
        MOV CX, valor
        CMP CX, base
        JB DIVBASE

        MOV BX, base
        MOV AX, valor
        DIV BX
        MOV cadena[SI], AL
        ADD cadena[SI], 48
        INC SI

        MUL BX
        SUB valor, AX

        CMP base, 1
        JE SALIRCC
        
        DIVBASE:
            CMP valor, 0
            JE ADDZERO

            MOV AX, base
            MOV BX, 10
            DIV BX
            MOV base, AX
            JMP CICLO
            
            ADDZERO:
                MOV cadena[SI], 48
                INC SI
    SALIRCC:
ENDM

Maximo MACRO
    XOR AX, AX
    MOV BX, numDatos
    DEC BX
    MOV AL, bufferDatos[BX]
    MOV entero, AX
    MOV SI, 0

    CrearCadena entero, cadenaResult
    MOV cadenaResult[SI], 46
    INC SI
    MOV cadenaResult[SI], 48
    INC SI
    MOV cadenaResult[SI], 48
    INC SI
    MOV cadenaResult[SI], 36
ENDM

Minimo MACRO
    XOR AX, AX
    MOV AL, bufferDatos[0]
    MOV entero, AX
    MOV SI, 0

    CrearCadena entero, cadenaResult
    MOV cadenaResult[SI], 46
    INC SI
    MOV cadenaResult[SI], 48
    INC SI
    MOV cadenaResult[SI], 48
    INC SI
    MOV cadenaResult[SI], 36
ENDM

Mediana MACRO
    LOCAL CalcPromedio, ExitCalcMediana, CicloDecimal
    XOR AX, AX
    XOR BX, BX
    XOR DX, DX

    MOV AX, numDatos
    MOV BX, 2
    DIV BX

    MOV BX, AX

    CMP DX, 0
    JZ CalcPromedio
    
    XOR DX, DX
    MOV DL, bufferDatos[BX]
    MOV entero, DX
    MOV SI, 0

    CrearCadena entero, cadenaResult

    MOV cadenaResult[SI], 46
    INC SI
    MOV cadenaResult[SI], 48
    INC SI
    MOV cadenaResult[SI], 48
    INC SI
    MOV cadenaResult[SI], 36
    JMP ExitCalcMediana

    CalcPromedio:
        XOR AX, AX
        DEC BX
        ADD AL, bufferDatos[BX]
        ADD AL, bufferDatos[BX + 1]
        MOV DX, 0
        MOV BX, 2
        DIV BX
        MOV entero, AX
        MOV decimal, DX
        MOV SI, 0

        CrearCadena entero, cadenaResult

        MOV cadenaResult[SI], 46
        INC SI

        CMP decimal, 0
        JNE CicloDecimal

        MOV cadenaResult[SI], 48
        INC SI
        MOV cadenaResult[SI], 48
        INC SI
        MOV cadenaResult[SI], 36
        JMP ExitCalcMediana

        CicloDecimal:
            MOV AX, decimal
            MOV BX, 10
            MOV DX, 0
            MUL BX

            MOV BX, 2
            MOV DX, 0
            DIV BX

            MOV decimal, DX
            MOV entero, AX
            CrearCadena entero, cadenaResult
            MOV AL, cantDecimal
            INC AL
            MOV cantDecimal, AL
            CMP AL, 2
            JNE CicloDecimal

    ExitCalcMediana:
        MOV cantDecimal, 0
ENDM

ContadorDatos MACRO
    XOR AX, AX
    MOV AX, numDatos
    MOV entero, AX
    MOV SI, 0

    CrearCadena entero, cadenaResult

    MOV cadenaResult[SI], 36

    comando Placeholder0, cadenaResult

ENDM

BuildTablaFrecuencias MACRO
    LOCAL forDatos, saveFrecuencia, ExitModa
    XOR AX, AX
    XOR BX, BX
    XOR CX, CX
    XOR SI, SI

    MOV CX, numDatos
    MOV AH, bufferDatos[BX]
    forDatos:
        CMP AH, bufferDatos[BX]
        JNE saveFrecuencia

        INC AL
        INC BX
        LOOP forDatos

        MOV tablaFrecuencias[SI], AH
        INC SI
        MOV tablaFrecuencias[SI], AL
        INC SI 

        JMP ExitModa

        saveFrecuencia:
            MOV tablaFrecuencias[SI], AH
            INC SI
            MOV tablaFrecuencias[SI], AL
            INC SI

            MOV AH, numEntradas
            INC AH
            MOV numEntradas, AH

            MOV AH, bufferDatos[BX]
            MOV AL, 0
        
        JMP forDatos

    ExitModa:
ENDM

OrderFrecuencies MACRO
    LOCAL for1, for2, Intercambio, terminarFor2
    XOR AX, AX
    XOR BX, BX
    XOR CX, CX
    XOR DX, DX

    MOV CL, numEntradas
    DEC CX
    MOV DL, 0
    for1:
        PUSH CX

        MOV CL, numEntradas
        DEC CX
        SUB CX, DX
        MOV SI, 0
        for2:
            MOV AH, tablaFrecuencias[SI]
            MOV AL, tablaFrecuencias[SI + 1]
            MOV BH, tablaFrecuencias[SI + 2]
            MOV BL, tablaFrecuencias[SI + 3]

            CMP AL, BL
            JA Intercambio
            ADD SI, 2
            LOOP for2
            JMP terminarFor2

            Intercambio:
                XCHG AX, BX
                MOV tablaFrecuencias[SI], AH
                MOV tablaFrecuencias[SI + 1], AL
                MOV tablaFrecuencias[SI + 2], BH
                MOV tablaFrecuencias[SI + 3], BL
                ADD SI, 2

            LOOP for2
        
        terminarFor2:
            POP CX
            INC DL
            LOOP for1

ENDM

Moda MACRO
    LOCAL CicloModa, ExitCalcModa
    XOR AX, AX
    XOR BX, BX
    MOV AL, numEntradas
    MOV BL, 2
    MUL BL
    MOV DI, AX
    DEC DI

    CicloModa:
        XOR AX, AX
        XOR BX, BX

        MOV AL, tablaFrecuencias[DI] ; ? Frecuencia
        DEC DI
        MOV BL, tablaFrecuencias[DI] ; ? Valor
        DEC DI
        
        PUSH AX
        MOV entero, BX
        MOV SI, 0
        MOV base, 10000
        CrearCadena entero, cadenaResult
        MOV cadenaResult[SI], 36

    PrintCadena MSGConsola2
    PrintCadena espacio
    PrintCadena CAbre
    PrintCadena cadenaResult

        POP AX
        MOV entero, AX
        
        PUSH AX
        MOV SI, 0
        MOV base, 10000

        CrearCadena entero, cadenaResult
        MOV cadenaResult[SI], 36

    PrintCadena coma
    PrintCadena cadenaResult
    PrintCadena CCierra
    PrintCadena salto

        POP AX
        
        CMP AL, tablaFrecuencias[DI]
        JA ExitCalcModa
        JMP CicloModa

    ExitCalcModa:
ENDM

Moda2 MACRO
LOCAL CicloModa, ExitCalcModa
    XOR AX, AX
    XOR BX, BX
    MOV AL, numEntradas
    MOV BL, 2
    MUL BL
    MOV DI, AX
    DEC DI

    CicloModa:
        EscribirArchivo salto
        EscribirArchivo StrToPrint3

        XOR AX, AX
        XOR BX, BX

        MOV AL, tablaFrecuencias[DI] ; ? Frecuencia
        DEC DI
        MOV BL, tablaFrecuencias[DI] ; ? Valor
        DEC DI
        
        PUSH AX
        MOV entero, BX
        MOV SI, 0
        MOV base, 10000
        CrearCadena entero, cadenaResult
        MOV cadenaResult[SI], 36

    EscribirArchivo2 cadenaResult

        POP AX
        MOV entero, AX
        
        PUSH AX
        MOV SI, 0
        MOV base, 10000

        CrearCadena entero, cadenaResult
        MOV cadenaResult[SI], 36

    EscribirArchivo coma
    EscribirArchivo2 cadenaResult

        POP AX
        
        CMP AL, tablaFrecuencias[DI]
        JA ExitCalcModa
        JMP CicloModa

    ExitCalcModa:
ENDM

PrintTablaFrecuencias MACRO
    LOCAL tabla, ExitPrintTabla
    ;PrintCadena salto
    ;PrintCadena msgEncabezadoTabla
    EscribirArchivo2 salto

    XOR AX, AX
    XOR BX, BX
    MOV AL, numEntradas
    MOV CX, AX
    MOV BL, 2
    MUL BL
    MOV DI, AX
    DEC DI

    tabla:
        PUSH CX
        XOR AX, AX
        XOR BX, BX

        MOV AL, tablaFrecuencias[DI]
        DEC DI
        MOV BL, tablaFrecuencias[DI]  
        DEC DI

        PUSH AX
        MOV entero, BX
        MOV SI, 0
        MOV base, 10000
        CrearCadena entero, cadenaResult
        MOV cadenaResult[SI], 36
        EscribirArchivo2 espacios
        EscribirArchivo2 cadenaResult

        POP AX
        MOV entero, AX
        
        MOV SI, 0
        MOV base, 10000
        CrearCadena entero, cadenaResult
        MOV cadenaResult[SI], 36
        EscribirArchivo2 espacios

        ;MOV AH, 2
        ;MOV DL, 124
        ;INT 21h

        EscribirArchivo2 espacios
        EscribirArchivo2 cadenaResult
        EscribirArchivo2 salto

        POP CX
        DEC CX
        CMP CX, 0
        JE ExitPrintTabla
        JMP tabla

    ExitPrintTabla:
ENDM

LimpiarConsola MACRO
    MOV AX, 03h
    INT 10h
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

    cmp al, 08h
    je retorno_de_carro

    ; Almacenar el carácter en el buffer
    mov [regBuffer + si], al

    ; Incrementar índice y contador de longitud
    inc si
    cmp si, maxLength
    jb read_char_loop
    jmp end_read

retorno_de_carro:
    dec si
    jmp read_char_loop

end_read:
    ; Agregar el carácter de fin de cadena
    mov [regBuffer + si], "$"
ENDM

CleanNameVar MACRO params
LOCAL Inicio
    mov si, 0h
Inicio:
    mov params[si], 32
    inc si

    cmp si, 100h
    jne Inicio
ENDM

CleanNameCSV MACRO
LOCAL Inicio, Fin
    mov si, 0h
Inicio:
    cmp opcion[si], "$"
    je Fin

    inc si
    jmp Inicio
Fin:
    mov opcion[si], 0
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

EscribirArchivo2 MACRO params
LOCAL Inicio, Fin
    push si
    mov si, 00h
Inicio:
    cmp params[si], "$"
    je Fin
    inc si
    jmp Inicio

Fin:
    mov ah, 40h  ; Función 40h: Escribir en archivo
    mov bx, filehandle  ; Manejador de archivo
    lea dx, params     ; Mensaje a escribir
    mov cx, si  ; Número de bytes a escribir
    int 21h      ; Llamar a DOS
    pop si
ENDM

ImpFechaHora MACRO
    ; Obtener la fecha actual
    mov ah, 2Ah                 ; Servicio para obtener la fecha actual
    int 21h                     ; Llamar a la interrupción DOS

    xor ax, ax
    mov bl, 0ah

    mov al, dl
    div bl
    add al, 30h
    add ah, 30h
    mov [fecha], al         ; Guardar decena día
    mov [fecha + 1], ah     ; Guardar unidad día
    mov [fecha + 2], 47

    xor ax, ax

    mov al, dh
    div bl
    add al, 30h
    add ah, 30h
    mov [fecha + 3], al     ; Guardar decena mes
    mov [fecha + 4], ah     ; Guardar unidad mes
    mov [fecha + 5], 47

    mov ax, cx 
    mov dx, 0h
    div bx
    add dl, 30h
    mov [fecha + 9], dl     ; Guardar unidades año
    
    div bl
    add ah, 30h
    mov [fecha + 8], ah     ; Guardar decenas año
    xor ah,ah

    div bl
    add ah, 30h
    mov [fecha + 7], ah     ; Guardar centenas año
    xor ah,ah

    div bl
    add ah, 30h
    mov [fecha + 6], ah     ; Guardar millares año
    xor ah,ah

    mov ah, 2Ch       ; Servicio para obtener la hora actual
    int 21h           ; Llamar a la interrupción DOS

    mov bl, 0ah
    xor ax, ax
    mov al, ch        ; Hora actual
    div bl
    add al, 30h
    add ah, 30h
    mov [hora], al ; Guardar hora
    mov [hora + 1], ah

    mov [hora + 2], 58 ; Caracter ':'

    xor ax, ax
    mov al, cl        ; Minutos actuales
    div bl
    add al, 30h
    add ah, 30h
    mov [hora + 3], al ; Guardar minutos
    mov [hora + 4], ah 

    mov [hora + 5], 58 ; Caracter ':'

    xor ax, ax
    mov al, dh        ; Segundos actuales
    div bl
    add al, 30h
    add ah, 30h
    mov [hora + 6], al ; Guardar segundos
    mov [hora + 7], ah
ENDM

CerrarArchivo MACRO
    mov ah, 3Eh  ; Función 3Eh: Cerrar archivo
    mov bx, filehandle  ; Manejador de archivo
    int 21h      ; Llamar a DOS
ENDM

CleanAgain? MACRO
    mov numEntradas, 1
    mov indexDatos,  0
    mov extensionArchivo, 0
    mov posApuntador, 0
    mov numDatos, 0
    mov base, 10000

    mov si, 00h
estoyAburrido:
    mov tablaFrecuencias[si], "$"
    inc si
    cmp si, 400
    jne estoyAburrido

    mov si, 00h
estoyAburrido2:
    mov bufferDatos[si], "$"
    inc si
    cmp si, 1200
    jne estoyAburrido2
ENDM

obtenerOpcion MACRO regOpcion
    MOV AH, 01h
    INT 21h

    MOV regOpcion, AL
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

printGraf MACRO
LOCAL bobleLineas
    mov ax, 13h
    int 10h                 ; Establecer modo gráfico 13h

    mov bx, 0h
bobleLineas:
    DrawSprite linea, 000Ah, bx, 01Eh, 01h
    DrawSprite linea, 0028h, bx, 01Eh, 01h
    DrawSprite linea, 0046h, bx, 01Eh, 01h
    DrawSprite linea, 0064h, bx, 01Eh, 01h
    DrawSprite linea, 0082h, bx, 01Eh, 01h
    DrawSprite linea, 00A0h, bx, 01Eh, 01h
    DrawSprite linea, 00BEh, bx, 01Eh, 01h
    DrawSprite linea, 00DCh, bx, 01Eh, 01h
    DrawSprite linea, 00FAh, bx, 01Eh, 01h
    DrawSprite linea, 0118h, bx, 01Eh, 01h

    add bx, 0Ah

    cmp bx, 0BEh
    Jb bobleLineas

    DrawSprite linea2, 000Ah, 0BEh, 01Eh, 01h
    DrawSprite linea2, 0028h, 0BEh, 01Eh, 01h
    DrawSprite linea2, 0046h, 0BEh, 01Eh, 01h
    DrawSprite linea2, 0064h, 0BEh, 01Eh, 01h
    DrawSprite linea2, 0082h, 0BEh, 01Eh, 01h
    DrawSprite linea2, 00A0h, 0BEh, 01Eh, 01h
    DrawSprite linea2, 00BEh, 0BEh, 01Eh, 01h
    DrawSprite linea2, 00DCh, 0BEh, 01Eh, 01h
    DrawSprite linea2, 00FAh, 0BEh, 01Eh, 01h
    DrawSprite linea2, 0118h, 0BEh, 01Eh, 01h


    DrawSprite linea3, 000Ah, 0000h, 01h, 0BEh



ENDM
