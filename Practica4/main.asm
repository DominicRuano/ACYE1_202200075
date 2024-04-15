INCLUDE macros.ASM

.MODEL small
.STACK 64h
.DATA
salto db 10,13, "$"
Prueba db 10 ,13, "Hola mundo", 10 ,13, "$"
opcion db 1 dup(?)

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
colorBlancoTexto db 0Fh ; Blanco sobre negro

MSGMenu1 db "  ____  ____  ____  ____  _________  ____  ____  ____  ____  ____  ____  ____ ", 10 ,13, "$"
MSGMenu2 db " ||M ||||e ||||n ||||u ||||       ||||I ||||n ||||i ||||c ||||i ||||a ||||l ||", 10 ,13, "$"
MSGMenu3 db " ||__||||__||||__||||__||||_______||||__||||__||||__||||__||||__||||__||||__||", 10 ,13, "$"
MSGMenu4 db " |/__\||/__\||/__\||/__\||/_______\||/__\||/__\||/__\||/__\||/__\||/__\||/__\|", 10 ,13, "$"

MSG1OP1 db "                    ___       __                ___  __   __ ", 10 ,13, "$"
MSG1OP2 db "    |    |\ | |  | |__  \  / /  \       | |  | |__  / _` /  \", 10 ,13, "$"
MSG1OP3 db "    |.   | \| \__/ |___  \/  \__/    \__/ \__/ |___ \__> \__/", 10 ,13, "$"

MSG2OP1 db "  __                             __     __      ", 10 ,13, "$"
MSG2OP2 db "  __|     /\  |\ | |  |\/|  /\  /  ` | /  \ |\ |", 10 ,13, "$"
MSG2OP3 db " |__ .   /~~\ | \| |  |  | /~~\ \__, | \__/ | \|", 10 ,13, "$"

MSG3OP1 db "  __             ___  __   __              __     __      ", 10 ,13, "$"
MSG3OP2 db "  __|    | |\ | |__  /  \ |__)  |\/|  /\  /  ` | /  \ |\ |", 10 ,13, "$"
MSG3OP3 db "  __|.   | | \| |    \__/ |  \  |  | /~~\ \__, | \__/ | \|", 10 ,13, "$"

MSG4OP1 db "           __               __  ", 10 ,13, "$"
MSG4OP2 db "  |__|    /__`  /\  |    | |__) ", 10 ,13, "$"
MSG4OP3 db "     |.   .__/ /~~\ |___ | |  \ ", 10 ,13, "$"

IngreseOpcion db "Ingrese una opcion: ", "$"
.CODE
    MOV AX, @data
    MOV DS, AX

    ; Metodo Principal (Main)
    Main PROC
        Menu:
            ImprimirMenuInicial

            ImprimirCadenas IngreseOpcion
            obtenerOpcion opcion

            CMP opcion, "1"
            JE Opcion1

            CMP opcion, "2"
            JE Opcion2

            CMP opcion, "3"
            JE Opcion3

            CMP opcion, "4"
            JE Salir

            JMP Menu

        Opcion1:
            JMP Menu

        Opcion2:
            JMP Menu
        
        Opcion3:
            JMP Menu


        Salir:
            ImprimirCadenas salto
            MOV AX, 4C00h ; Interrupcion Para Terminar Programa
            INT 21h
    Main ENDP
END