INCLUDE macros.ASM

.MODEL small
.STACK 64h
.DATA
    msg db " hola mundo", "$"
    
.CODE
    MOV AX, @data
    MOV DS, AX

    ; Metodo Principal (Main)
    Main PROC

        Salir:
            ImprimirCadenas msg
            
            MOV AX, 4C00h ; Interrupcion Para Terminar Programa
            INT 21h
    Main ENDP
END