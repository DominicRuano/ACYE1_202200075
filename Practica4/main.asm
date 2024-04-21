INCLUDE macros2.ASM
INCLUDE macros.ASM

.MODEL small
.STACK 64h
.DATA
salto db 10,13, "$"
espacio db " ", "$"
espacio11 db "            ", "$"
espacio12 db "          ", "$"
DosPuntos db ":", "$"
espacio20 db 10, 13, "                 ", "$"
Prueba db 10 ,13, "Hola mundo", 10 ,13, "$"
opcion db 1 dup(?)
Espacio3 db "$"
IngreseOpcion db "Ingrese una opcion: ", "$"
PParaContinuar db "                   Presione Cualquier tecla para continuar...", "$"
IngreseNameP1 db "Ingrese el nombre del Jugador 1: ", "$"
IngreseNameP2 db "Ingrese el nombre del Jugador 2: ", "$" 
OpcionYN1 db "El nombre: ", "$"
OpcionYN2 db "es correcto? (y/n): ", "$"
IngMovTotito db "Ingrese movimiento: $"
Winer db "Ganador: ", "$"
WinerEmpate db "Ganador: Empate", "$"
WinerEmpate2 db "Empate      ", "$"
Jugador1 db 11 dup(32)
Espacio1 db "$"
Jugador2 db 11 dup(32)
Espacio2 db "$"
PosX db 1 dup(32)
Espacio4 db "$"
PosY db 1 dup(32)
Espacio5 db "$"
IA db "IA", "$"
Tablero db 9 dup(32)
Turno db 1 dup("o")
Contador db 1 dup(9)
Apuntaddor db "-->"
Contador2 db 1 dup(0ffh)
filehandle dw ?
bytesRead dw ?
dataTXT db 1024 dup("$")
segundos db 2 dup("$")
Barra db "|", "$"
horaDB db 18 dup("$")
nombreDB db "DB.txt", 0


    handler             dw ?
    filename            db "Input2.txt", 0
    errorCode           db ?
    errorOpenFile       db "Ocurrio Un Error Al Abrir El Archivo - ERRCODE: ", "$"
    errorCloseFile      db "Ocurrio Un Error Al Cerrar El Archivo - ERRCODE: ", "$"
    errorReadFile       db "Ocurrio Un Error Al Leer El Archivo - ERRCODE: ", "$"
    errorSizeFile       db "Ocurrio Un Error Obteniendo El Size Del Archivo - ERRCODE: ", "$"
    exitOpenFileMsg     db "El Archivo Se Abrio Correctamente", "$"
    exitCloseFileMsg    db "El Archivo Se Cerro Correctamente", "$"
    exitSizeFileMsg     db "Se Obtuvo La Longitud Correctamente", "$"
    bufferTemporal      db 80 dup("$")
    bufferImagen1       db 900 dup("$")
    bufferImagen2       db 900 dup("$")
    bufferImagen3       db 900 dup("$")
    bufferImagen4       db 900 dup("$")
    bufferImagen5       db 900 dup("$")
    bufferImagen6       db 900 dup("$")
    bufferImagen7       db 900 dup("$")
    bufferImagen8       db 900 dup("$")
    charsPerRow1        dw ?
    cantRows1           dw ?
    charsPerRow2        dw ?
    cantRows2           dw ?
    charsPerRow3        dw ?
    cantRows3           dw ?
    charsPerRow4        dw ?
    cantRows4           dw ?
    charsPerRow5        dw ?
    cantRows5           dw ?
    charsPerRow6        dw ?
    cantRows6           dw ?
    charsPerRow7        dw ?
    cantRows7           dw ?
    charsPerRow8        dw ?
    cantRows8           dw ?
    saltoCadena         dw ?
    extensionArchivo    dw 0
    posApuntador        dw 0
    filaActual          db 0
    fila                db 0
    columna             db 5
    paginaActual        db 0


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

REPORTE1 db "  ____________________________________________________________________________", 10, 13, "$"
REPORTE2 db "  | Fecha  | Hora   | Jugador1 | Jugador2 | Resultados | Ganador  | Perdedor |", 10, 13, "$"
REPORTE3 db "  |--------|--------|----------|----------|------------|----------|----------|", 10, 13, "$"
REPORTE4 db "  |__________________________________________________________________________|", 10, 13, "$"      
REPORTE5 db "  |                             NO HAY REGISTROS                             |", 10, 13, "$"      

Info11 db "     ____                        __                             __ __      ", 10, 13, "$"
Info12 db "    /\  _`\                     /\ \__  __                     /\ \\ \     ", 10, 13, "$"
Info13 db "    \ \ \_\ \_ __    __      ___\ \ ,_\/\_\    ___     __      \ \ \\ \    ", 10, 13, "$"
Info14 db "     \ \ ,__/\`'__\/'__`\   /'___\ \ \/\/\ \  /'___\ /'__`\     \ \ \\ \_  ", 10, 13, "$"
Info15 db "      \ \ \/\ \ \//\ \_\.\_/\ \__/\ \ \_\ \ \/\ \__//\ \_\.\_    \ \__ ,__\", 10, 13, "$"
Info16 db "       \ \_\ \ \_\\ \__/.\_\ \____\\ \__\\ \_\ \____\ \__/.\_\    \/_/\_\_/", 10, 13, "$"
Info17 db "        \/_/  \/_/ \/__/\/_/\/____/ \/__/ \/_/\/____/\/__/\/_/       \/_/  ", 10, 13, "$"

Info21 db " +-+-+-+-+-+-+-+-+-+-+-+ +-+-+-+ +-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+-+  ", 10, 13, "$"
Info22 db " |U|n|i|v|e|r|s|i|d|a|d| |S|a|n| |C|a|r|l|o|s| |d|e| |G|u|a|t|e|m|a|l|a|  ", 10, 13, "$"
Info23 db " +-+-+-+-+-+-+-+-+-+-+-+ +-+-+-+ +-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+-+  ", 10, 13, "$"

Info31 db " +-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+-+-+", 10, 13, "$"
Info32 db " |F|a|c|u|l|t|a|d| |d|e| |I|n|g|e|n|i|e|r|i|a|", 10, 13, "$"
Info33 db " +-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+-+-+", 10, 13, "$"

Info41 db " +-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+ +-+ +-+-+-+-+-+-+-+-+", 10, 13, "$"
Info42 db " |E|s|c|u|e|l|a| |d|e| |C|i|e|n|c|i|a|s| |y| |S|i|s|t|e|m|a|s|", 10, 13, "$"
Info43 db " +-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+ +-+ +-+-+-+-+-+-+-+-+", 10, 13, "$"

Info51 db " +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+", 10, 13, "$"
Info52 db " |A|r|q|u|i|t|e|c|t|u|r|a| |d|e| |C|o|m|p|u|t|a|d|o|r|e|s| |y|", 10, 13, "$"
Info53 db " +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+", 10, 13, "$"
Info54 db " |E|n|s|a|m|b|l|a|d|o|r|e|s|                                  ", 10, 13, "$"
Info55 db " +-+-+-+-+-+-+-+-+-+-+-+-+-+                                  ", 10, 13, "$"

Info61 db " +-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+ +-+-+-+-+", 10, 13, "$"
Info62 db " |P|r|i|m|e|r| |s|e|m|e|s|t|r|e| |2|0|2|4|", 10, 13, "$"
Info63 db " +-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+ +-+-+-+-+", 10, 13, "$"

Info71 db " +-+-+-+-+-+-+-+ +-+-+-+-+ +-+-+-+-+-+ +-+-+-+-+-+ +-+-+-+-+-+", 10, 13, "$"
Info72 db " |D|o|m|i|n|i|c| |J|u|a|n| |P|a|b|l|o| |R|u|a|n|o| |P|e|r|e|z|", 10, 13, "$"
Info73 db " +-+-+-+-+-+-+-+ +-+-+-+-+ +-+-+-+-+-+ +-+-+-+-+-+ +-+-+-+-+-+", 10, 13, "$"

Info81 db " +-+-+-+-+-+-+-+-+-+", 10, 13, "$"
Info82 db " |2|0|2|2|0|0|0|7|5|", 10, 13, "$"
Info83 db " +-+-+-+-+-+-+-+-+-+", 10, 13, "$"

;PAREDES TOTITO
empty_block db     00, 00, 00, 00, 00, 00, 00, 00
            db     00, 00, 00, 00, 00, 00, 00, 00
            db     00, 00, 00, 00, 00, 00, 00, 00
            db     00, 00, 00, 00, 00, 00, 00, 00
            db     00, 00, 00, 00, 00, 00, 00, 00
            db     00, 00, 00, 00, 00, 00, 00, 00
            db     00, 00, 00, 00, 00, 00, 00, 00
            db     00, 00, 00, 00, 00, 00, 00, 00

wall_three  db     00, 00, 03, 03, 03, 03, 00, 00
            db     00, 00, 03, 03, 03, 03, 00, 00
            db     00, 00, 03, 03, 03, 03, 00, 00
            db     00, 00, 03, 03, 03, 03, 00, 00
            db     00, 00, 03, 03, 03, 03, 00, 00
            db     00, 00, 03, 03, 03, 03, 00, 00
            db     00, 00, 03, 03, 03, 03, 00, 00
            db     00, 00, 03, 03, 03, 03, 00, 00

wall_four   db     00, 00, 00, 00, 00, 00, 00, 00
            db     00, 00, 00, 00, 00, 00, 00, 00
            db     03, 03, 03, 03, 03, 03, 03, 03
            db     03, 03, 03, 03, 03, 03, 03, 03
            db     03, 03, 03, 03, 03, 03, 03, 03
            db     03, 03, 03, 03, 03, 03, 03, 03
            db     00, 00, 00, 00, 00, 00, 00, 00
            db     00, 00, 00, 00, 00, 00, 00, 00

wall_six    db     00, 00, 03, 03, 03, 03, 00, 00
            db     00, 00, 03, 03, 03, 03, 00, 00
            db     03, 03, 03, 03, 03, 03, 03, 03
            db     03, 03, 03, 03, 03, 03, 03, 03
            db     03, 03, 03, 03, 03, 03, 03, 03
            db     03, 03, 03, 03, 03, 03, 03, 03
            db     00, 00, 03, 03, 03, 03, 00, 00
            db     00, 00, 03, 03, 03, 03, 00, 00

;FIGURA X
barrax_uno      db     04, 04, 00, 00, 00, 00, 00, 00
                db     00, 04, 04, 00, 00, 00, 00, 00
                db     00, 00, 04, 04, 00, 00, 00, 00
                db     00, 00, 00, 04, 04, 00, 00, 00
                db     00, 00, 00, 00, 04, 04, 00, 00
                db     00, 00, 00, 00, 00, 04, 04, 00
                db     00, 00, 00, 00, 00, 00, 04, 04
                db     00, 00, 00, 00, 00, 00, 00, 04

barrax_dos      db     00, 00, 00, 00, 00, 00, 04, 04
                db     00, 00, 00, 00, 00, 04, 04, 00
                db     00, 00, 00, 00, 04, 04, 00, 00
                db     00, 00, 00, 04, 04, 00, 00, 00
                db     00, 00, 04, 04, 00, 00, 00, 00
                db     00, 04, 04, 00, 00, 00, 00, 00
                db     04, 04, 00, 00, 00, 00, 00, 00
                db     04, 00, 00, 00, 00, 00, 00, 00

;FIGURA O
barrao_uno      db     00, 00, 00, 00, 00, 06, 06, 06
                db     00, 00, 00, 06, 06, 06, 06, 06
                db     00, 00, 06, 06, 06, 00, 00, 00
                db     00, 06, 06, 06, 00, 00, 00, 00
                db     00, 06, 06, 00, 00, 00, 00, 00
                db     06, 06, 00, 00, 00, 00, 00, 00
                db     06, 06, 00, 00, 00, 00, 00, 00
                db     06, 06, 00, 00, 00, 00, 00, 00

barrao_dos      db     06, 06, 00, 00, 00, 00, 00, 00
                db     06, 06, 00, 00, 00, 00, 00, 00
                db     06, 06, 00, 00, 00, 00, 00, 00
                db     00, 06, 06, 00, 00, 00, 00, 00
                db     00, 06, 06, 06, 00, 00, 00, 00
                db     00, 00, 06, 06, 06, 00, 00, 00
                db     00, 00, 00, 06, 06, 06, 06, 06
                db     00, 00, 00, 00, 00, 06, 06, 06

barrao_tres     db     06, 06, 06, 00, 00, 00, 00, 00
                db     06, 06, 06, 06, 06, 00, 00, 00
                db     00, 00, 00, 06, 06, 06, 00, 00
                db     00, 00, 00, 00, 06, 06, 06, 00
                db     00, 00, 00, 00, 00, 06, 06, 00
                db     00, 00, 00, 00, 00, 00, 06, 06
                db     00, 00, 00, 00, 00, 00, 06, 06
                db     00, 00, 00, 00, 00, 00, 06, 06

barrao_cuatro   db     00, 00, 00, 00, 00, 00, 06, 06
                db     00, 00, 00, 00, 00, 00, 06, 06
                db     00, 00, 00, 00, 00, 00, 06, 06
                db     00, 00, 00, 00, 00, 06, 06, 00
                db     00, 00, 00, 00, 06, 06, 06, 00
                db     00, 00, 00, 06, 06, 06, 00, 00
                db     06, 06, 06, 06, 06, 00, 00, 00
                db     06, 06, 06, 00, 00, 00, 00, 00

String  db 00h, 04h, 04h, 04h, 04h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db 00h, 00h, 04h, 04h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db 00h, 00h, 04h, 04h, 00h, 00h, 00h, 00h, 04h, 04h, 04h, 04h, 04h, 00h, 00h, 00h, 00h, 04h, 04h, 04h, 00h, 04h, 04h, 00h, 04h, 04h, 00h, 04h, 04h, 04h, 00h, 00h, 00h, 04h, 04h, 04h, 04h, 00h, 00h, 00h, 00h, 04h, 04h, 04h, 04h, 04h, 00h, 00h
        db 00h, 00h, 04h, 04h, 00h, 00h, 00h, 00h, 04h, 04h, 00h, 00h, 04h, 04h, 00h, 00h, 04h, 04h, 00h, 00h, 04h, 04h, 00h, 00h, 00h, 04h, 04h, 04h, 00h, 04h, 04h, 00h, 04h, 04h, 00h, 00h, 04h, 04h, 00h, 00h, 04h, 04h, 00h, 00h, 00h, 00h, 00h, 00h
        db 00h, 00h, 04h, 04h, 00h, 00h, 00h, 00h, 04h, 04h, 00h, 00h, 04h, 04h, 00h, 00h, 04h, 04h, 00h, 00h, 04h, 04h, 00h, 00h, 00h, 04h, 04h, 00h, 00h, 04h, 04h, 00h, 04h, 04h, 04h, 04h, 04h, 04h, 00h, 00h, 00h, 04h, 04h, 04h, 04h, 00h, 00h, 00h
        db 00h, 00h, 04h, 04h, 00h, 00h, 00h, 00h, 04h, 04h, 00h, 00h, 04h, 04h, 00h, 00h, 00h, 04h, 04h, 04h, 04h, 04h, 00h, 00h, 00h, 04h, 04h, 00h, 00h, 00h, 00h, 00h, 04h, 04h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 04h, 04h, 00h, 00h
        db 00h, 04h, 04h, 04h, 04h, 00h, 00h, 00h, 04h, 04h, 00h, 00h, 04h, 04h, 00h, 00h, 00h, 00h, 00h, 00h, 04h, 04h, 00h, 00h, 04h, 04h, 04h, 04h, 00h, 00h, 00h, 00h, 00h, 04h, 04h, 04h, 04h, 00h, 00h, 00h, 04h, 04h, 04h, 04h, 04h, 00h, 00h, 00h
        db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 04h, 04h, 04h, 04h, 04h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h

String2 db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 04h, 04h, 00h, 00h, 00h, 00h
        db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db 00h, 04h, 04h, 04h, 04h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 04h, 04h, 00h, 00h, 04h, 04h, 00h, 00h, 00h, 04h, 04h, 04h, 04h, 00h, 00h, 00h, 04h, 04h, 00h, 00h, 04h, 04h, 00h, 00h, 00h, 04h, 04h, 04h, 00h, 00h, 00h, 00h
        db 04h, 04h, 00h, 00h, 04h, 04h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 04h, 04h, 04h, 04h, 04h, 04h, 04h, 00h, 04h, 04h, 00h, 00h, 04h, 04h, 00h, 00h, 04h, 04h, 00h, 00h, 04h, 04h, 00h, 00h, 00h, 00h, 04h, 04h, 00h, 00h, 00h, 00h
        db 04h, 04h, 04h, 04h, 04h, 04h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 04h, 04h, 04h, 04h, 04h, 04h, 04h, 00h, 04h, 04h, 00h, 00h, 04h, 04h, 00h, 00h, 04h, 04h, 00h, 00h, 04h, 04h, 00h, 00h, 00h, 00h, 04h, 04h, 00h, 00h, 00h, 00h
        db 04h, 04h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 04h, 04h, 00h, 04h, 00h, 04h, 04h, 00h, 04h, 04h, 00h, 00h, 04h, 04h, 00h, 00h, 00h, 04h, 04h, 04h, 04h, 00h, 00h, 00h, 00h, 00h, 04h, 04h, 00h, 00h, 00h, 00h
        db 00h, 04h, 04h, 04h, 04h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 04h, 04h, 00h, 00h, 00h, 04h, 04h, 00h, 00h, 04h, 04h, 04h, 04h, 00h, 00h, 00h, 00h, 00h, 04h, 04h, 00h, 00h, 00h, 00h, 00h, 04h, 04h, 04h, 04h, 00h, 00h, 00h
        db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h


String3 db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 04h, 04h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 04h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 04h, 04h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db 04h, 04h, 00h, 00h, 04h, 04h, 00h, 00h, 00h, 04h, 04h, 04h, 00h, 00h, 00h, 00h, 00h, 04h, 04h, 04h, 04h, 00h, 00h, 00h, 04h, 04h, 04h, 04h, 04h, 00h, 00h, 00h, 00h, 04h, 04h, 04h, 04h, 04h, 00h, 00h, 00h, 04h, 04h, 04h, 04h, 00h, 00h, 00h
        db 04h, 04h, 04h, 04h, 04h, 04h, 04h, 00h, 00h, 00h, 04h, 04h, 00h, 00h, 00h, 00h, 04h, 04h, 00h, 00h, 04h, 04h, 00h, 00h, 04h, 04h, 00h, 00h, 04h, 04h, 00h, 00h, 00h, 00h, 04h, 04h, 00h, 00h, 00h, 00h, 04h, 04h, 00h, 00h, 04h, 04h, 00h, 00h
        db 04h, 04h, 04h, 04h, 04h, 04h, 04h, 00h, 00h, 00h, 04h, 04h, 00h, 00h, 00h, 00h, 04h, 04h, 04h, 04h, 04h, 04h, 00h, 00h, 04h, 04h, 00h, 00h, 04h, 04h, 00h, 00h, 00h, 00h, 04h, 04h, 00h, 00h, 00h, 00h, 04h, 04h, 00h, 00h, 04h, 04h, 00h, 00h
        db 04h, 04h, 00h, 04h, 00h, 04h, 04h, 00h, 00h, 00h, 04h, 04h, 00h, 00h, 00h, 00h, 04h, 04h, 00h, 00h, 00h, 00h, 00h, 00h, 04h, 04h, 00h, 00h, 04h, 04h, 00h, 00h, 00h, 00h, 04h, 04h, 00h, 04h, 00h, 00h, 04h, 04h, 00h, 00h, 04h, 04h, 00h, 00h
        db 04h, 04h, 00h, 00h, 00h, 04h, 04h, 00h, 00h, 04h, 04h, 04h, 04h, 00h, 00h, 00h, 00h, 04h, 04h, 04h, 04h, 00h, 00h, 00h, 04h, 04h, 00h, 00h, 04h, 04h, 00h, 00h, 00h, 00h, 00h, 04h, 04h, 00h, 00h, 00h, 00h, 04h, 04h, 04h, 04h, 00h, 00h, 00h
        db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h

String4 db 00h, 00h, 00h, 00h, 00h
        db 00h, 00h, 00h, 00h, 00h
        db 04h, 04h, 00h, 00h, 00h
        db 00h, 00h, 04h, 00h, 00h
        db 00h, 00h, 04h, 00h, 00h
        db 04h, 00h, 04h, 00h, 04h
        db 00h, 04h, 04h, 04h, 00h
        db 00h, 00h, 04h, 00h, 00h

;, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h 25tms

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
                    CleanTab
                    mov Turno, "x"
                    InicializarContador
                    LimpiarConsola
                    GetName IngreseNameP1, Jugador1
                    NameJ2CPU
                    TurnoJ1CPU:
                        LimpiarConsola
                        PrintTablero
                        ImprimirCadenas espacio20
                        GetMov
                        EscribirMov2 Turno
                        Sleep 1eh
                        ValidarWin

                    Turnoj2CPU:
                        LimpiarConsola
                        Contador1
                        PrintTablero
                        ImprimirCadenas espacio20
                    GMovs2:
                        GetMov2
                        EscribirMov2 Turno
                        ImprimirCadenas PosX
                        ImprimirCadenas DosPuntos
                        ImprimirCadenas PosY
                        Sleep 1eh
                    MMov2:
                        ValidarWin
                        
                        jmp TurnoJ1CPU
                
                JVZ1:
                    CleanTab
                    mov Turno, "x"
                    InicializarContador
                    LimpiarConsola
                    GetName IngreseNameP1, Jugador1
                    GetName IngreseNameP2, Jugador2
                    TurnoJ1:
                        LimpiarConsola
                        PrintTablero
                        ImprimirCadenas espacio20
                        GetMov
                        EscribirMov Turno
                        Sleep 1eh
                        ValidarWin

                    Turnoj2:
                        LimpiarConsola
                        PrintTablero
                        ImprimirCadenas espacio20
                        GetMov
                        EscribirMov Turno
                        Sleep 1eh
                        ValidarWin
                        
                        jmp TurnoJ1

                REPORTES:
                    LimpiarConsola
                    ;Sleep 4bh
                    ImprimirReporte
                    JMP NuevoJuevo

            Animacion:  
                LimpiarConsola
                CargarFile


                MOV AH, 10h
                INT 16h

                MOV AX, 03h
                INT 10h

            CicloAnimaciones:
                MOV fila, 0
                MOV filaActual, 0
                MOV columna, 0
                
                CMP paginaActual, 0 ; * Salto A Pagina 1
                JZ EtAnimacion1Aux

                CMP paginaActual, 1 ; * Salto A Pagina 2
                JZ EtAnimacion2Aux

                CMP paginaActual, 2 ; * Salto A Pagina 3
                JZ EtAnimacion3Aux

                CMP paginaActual, 3 ; * Salto A Pagina 4
                JZ EtAnimacion4Aux

                CMP paginaActual, 4 ; * Salto A Pagina 5
                JZ EtAnimacion5Aux

                CMP paginaActual, 5; * Salto A Pagina 5
                JZ EtAnimacion6Aux

                CMP paginaActual, 6 ; * Salto A Pagina 5
                JZ EtAnimacion7Aux

                CMP paginaActual, 7 ; * Salto A Pagina 5
                JZ EtAnimacion8Aux

                JMP Salir   ; ! -> Si "paginaActual" Sobrepasa A Los Valores Definidos Que Salga Del Ciclo

                ; ? ETIQUETAS AUXILIARES PARA EVITAR ERRORES CON LA LONGITUD DE SALTOS
                EtAnimacion1Aux:    
                    JMP EtAnimacion1
                EtAnimacion2Aux:
                    JMP EtAnimacion2
                EtAnimacion3Aux:
                    JMP EtAnimacion3
                EtAnimacion4Aux:
                    JMP EtAnimacion4
                EtAnimacion5Aux:
                    JMP EtAnimacion5
                EtAnimacion6Aux:
                    JMP EtAnimacion6
                EtAnimacion7Aux:
                    JMP EtAnimacion7
                EtAnimacion8Aux:
                    JMP EtAnimacion8

                ; * Invocacion Animacion 1
                EtAnimacion1:
                    Animacion1 charsPerRow1, cantRows1, bufferImagen1
                    JMP CicloAnimaciones

                ; * Invocacion Animacion 2
                EtAnimacion2:
                    Animacion2 charsPerRow2, cantRows2, bufferImagen2
                    JMP CicloAnimaciones

                ; * Invocacion Animacion 3
                EtAnimacion3:
                    Animacion3 charsPerRow3, cantRows3, bufferImagen3
                    JMP CicloAnimaciones

                ; * Invocacion Animacion 4
                EtAnimacion4:
                    Animacion4 charsPerRow4, cantRows4, bufferImagen4
                    JMP CicloAnimaciones

                EtAnimacion5:
                    Animacion1 charsPerRow5, cantRows5, bufferImagen5
                    JMP CicloAnimaciones

                    EtAnimacion6:
                    Animacion1 charsPerRow6, cantRows6, bufferImagen6
                    JMP CicloAnimaciones

                    EtAnimacion7:
                    Animacion1 charsPerRow7, cantRows7, bufferImagen7
                    JMP CicloAnimaciones
                    
                    EtAnimacion8:
                    Animacion1 charsPerRow8, cantRows8, bufferImagen8
                    JMP CicloAnimaciones



                JMP Menu
            
            Informacion:
                LimpiarConsola
                ImprimirInformacion
                PresioneTeclaParaContinuar
                JMP Menu

        Salir:
            ImprimirCadenas salto
            MOV AX, 4C00h ; Interrupcion Para Terminar Programa
            INT 21h
    Main ENDP

END