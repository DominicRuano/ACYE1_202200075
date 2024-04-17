INCLUDE macros.ASM

.MODEL small
.STACK 64h
.DATA
salto db 10,13, "$"
Prueba db 10 ,13, "Hola mundo", 10 ,13, "$"
opcion db 1 dup(?)
IngreseOpcion db "Ingrese una opcion: ", "$"

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

MSGMenu1 db "     ____  ____  ____  ____        ____  ____  ____  ____  ____  ____  ____ ", 10 ,13, "$"
MSGMenu2 db "    ||M ||||e ||||n ||||u ||      ||I ||||n ||||i ||||c ||||i ||||a ||||l ||", 10 ,13, "$"
MSGMenu3 db "    ||__||||__||||__||||__||      ||__||||__||||__||||__||||__||||__||||__||", 10 ,13, "$"
MSGMenu4 db "    |/__\||/__\||/__\||/__\|      |/__\||/__\||/__\||/__\||/__\||/__\||/__\|", 10 ,13, "$"

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


MSG0NG1 db "    _____     _             _                                       _        ",10, 13, "$"
MSG0NG2 db "   |   __|___| |___ ___ ___|_|___ ___ ___    _ _ ___    _____ ___ _| |___    ",10, 13, "$"
MSG0NG3 db "   |__   | -_| | -_|  _|  _| | . |   | -_|  | | |   |  |     | . | . | . |   ",10, 13, "$"
MSG0NG4 db "   |_____|___|_|___|___|___|_|___|_|_|___|  |___|_|_|  |_|_|_|___|___|___|   ",10, 13, "$"

MSG1NG1 db "  __        __    _  _  ____     ___  ____  _  _ " ,10, 13, "$"
MSG1NG2 db " /  \      /  \  / )( \(__  )   / __)(  _ \/ )( \",10, 13, "$"
MSG1NG3 db "(_/ / _   (_/ /  \ \/ / / _/   ( (__  ) __/) \/ (",10, 13, "$"
MSG1NG4 db " (__)(_)   (__)   \__/ (____)   \___)(__)  \____/",10, 13, "$"

MSG2NG1 db " ____        __    _  _  ____     __  ",10, 13, "$"
MSG2NG2 db "(___ \      /  \  / )( \(__  )   /  \ ",10, 13, "$"
MSG2NG3 db " / __/ _   (_/ /  \ \/ / / _/   (_/ / ",10, 13, "$"
MSG2NG4 db "(____)(_)   (__)   \__/ (____)   (__) ",10, 13, "$"

MSG3NG1 db " ____       ____  ____  ____   __  ____  ____  ____  ____ ",10, 13, "$"
MSG3NG2 db "( __ \     (  _ \(  __)(  _ \ /  \(  _ \(_  _)(  __)/ ___)",10, 13, "$"
MSG3NG3 db " (__ ( _    )   / ) _)  ) __/(  O ))   /  )(   ) _) \___ \",10, 13, "$"
MSG3NG4 db "(____/(_)  (__\_)(____)(__)   \__/(__\_) (__) (____)(____/",10, 13, "$"

MSG4NG1 db "  ___       ____  ____  ___  ____  ____  ____   __   ____ ",10, 13, "$"
MSG4NG2 db " / _ \     (  _ \(  __)/ __)(  _ \(  __)/ ___) / _\ (  _ \",10, 13, "$"
MSG4NG3 db "(__  ( _    )   / ) _)( (_ \ )   / ) _) \___ \/    \ )   /",10, 13, "$"
MSG4NG4 db "  (__/(_)  (__\_)(____)\___/(__\_)(____)(____/\_/\_/(__\_)",10, 13, "$"



.CODE
    MOV AX, @data
    MOV DS, AX

    ; Metodo Principal (Main)
    Main PROC
        Menu:
            ImprimirMenuInicial
            ImprimirCadenasColor IngreseOpcion, colorAmarilloTexto
            obtenerOpcion opcion

            CMP opcion, "1"
            JE NuevoJuevo

            CMP opcion, "2"
            JE Animacion

            CMP opcion, "3"
            JE Informacion

            CMP opcion, "4"
            JE Salir

            JMP Menu

            NuevoJuevo:
                ImprimirNuevoJuego
                ImprimirCadenasColor IngreseOpcion, colorAmarilloTexto
                obtenerOpcion opcion

                CMP opcion, "1"
                JE JVZCPU

                CMP opcion, "2"
                JE JVZ1

                CMP opcion, "3"
                JE REPORTES

                CMP opcion, "4"
                JE Menu

                JMP NuevoJuevo
                
                JVZCPU:
                    LimpiarConsola
                    ImprimirCadenasColor IngreseOpcion, colorAmarilloTexto
                    obtenerOpcion opcion
                    JMP NuevoJuevo
                
                JVZ1:
                    LimpiarConsola
                    ImprimirCadenasColor IngreseOpcion, colorAmarilloTexto
                    obtenerOpcion opcion
                    JMP NuevoJuevo
                
                REPORTES:
                    LimpiarConsola
                    ImprimirCadenasColor IngreseOpcion, colorAmarilloTexto
                    obtenerOpcion opcion
                    JMP NuevoJuevo


            Animacion:
                JMP Menu
            
            Informacion:
                JMP Menu

        Salir:
            ImprimirCadenas salto
            MOV AX, 4C00h ; Interrupcion Para Terminar Programa
            INT 21h
    Main ENDP
END