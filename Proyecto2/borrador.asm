            PrintCadena msgToRequestFile
            PedirCadena filename

            ; * Extraer Informacion Del CSV
            OpenFile
            GetSizeFile handlerFile
            ReadCSV handlerFile, numCSV
            CloseFile handlerFile

            ; * Ordenar Datos - Ordenamiento Burbuja
            OrderData

            ; * Promedio
            Promedio
            MOV base, 10000

            ; * Maximo
            Maximo
            MOV base, 10000

            ; * Minimo
            Minimo
            MOV base, 10000

            ; * Mediana
            Mediana
            MOV base, 10000

            ; * Contador De Datos
            ContadorDatos
            MOV base, 10000

            ; * Construir Tabla De Frecuencias
            BuildTablaFrecuencias
            OrderFrecuencies
            MOV base, 10000

            ; * Moda
            Moda
            MOV base, 10000

            ; * Print Tabla Frecuencias
            PrintTablaFrecuencias