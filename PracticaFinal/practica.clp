; Templates para guardar los datos

(deftemplate Valor
	(field Nombre)
	(field Precio)
  (field VariacionDiaAnterior)
  (field Capitalizacion)
  (field PER)
  (field RPD)
  (field Tamano)
  (field PorcentajeIbex)
  (field EtiquetaPER)
  (field EtiquetaRPD)
  (field Sector)
  (field Variacion5Dias)
  (field Bajada3Dias)
  (field Bajada5Dias)
  (field Variacion5DiasSector)
  (field Variacion5DiasSectorMenor5)
  (field VariacionPrecio1Mes)
  (field VariacionPrecio3Meses)
  (field VariacionPrecio6Meses)
  (field VariacionPrecio1Ano)
)

(deftemplate Sector
  (field Nombre)
  (field VariacionDia)
  (field Capitalizacion)
  (field PER)
  (field RPD)
  (field PorcentajeIbex)
  (field Variacion5Dias)
  (field Bajada3Dias)
  (field Bajada5Dias)
  (field Variacion1Mes)
  (field Variacion3Meses)
  (field Variacion6Meses)
  (field Variacion1Ano)
)

(deftemplate Cartera
  (field Nombre)
  (field Acciones)
  (field ValorActual)
)

; Empieza el módulo para leer los datos de cada valor en el mercado
(defrule openfile
  (declare (salience 10))
  =>
  (open "Analisis.txt" datosValores)
  (assert (SeguirLeyendoValores))
)

(defrule LeerValoresCierreFromFile
  ?f <- (SeguirLeyendoValores)
  =>
  (bind ?NombreValor (read datosValores))
  (retract ?f)
  (if (neq ?NombreValor EOF) then
    (assert (Valor
      (Nombre ?NombreValor)
      (Precio (read datosValores))
      (VariacionDiaAnterior  (read datosValores))
      (Capitalizacion (read datosValores))
      (PER (read datosValores))
      (RPD (read datosValores))
      (Tamano (read datosValores))
      (PorcentajeIbex (read datosValores))
      (EtiquetaPER (read datosValores))
      (EtiquetaRPD (read datosValores))
      (Sector (read datosValores))
      (Variacion5Dias (read datosValores))
      (Bajada3Dias (read datosValores))
      (Bajada5Dias (read datosValores))
      (Variacion5DiasSector (read datosValores))
      (Variacion5DiasSectorMenor5 (read datosValores))
      (VariacionPrecio1Mes (read datosValores))
      (VariacionPrecio3Meses (read datosValores))
      (VariacionPrecio6Meses (read datosValores))
      (VariacionPrecio1Ano (read datosValores))))
    (assert (SeguirLeyendoValores)))
)

(defrule closefile
  (declare (salience -10))
  =>
  (close datosValores)
)
; Termina el módulo para leer los datos de cada valor

; Empieza el módulo para leer los datos de cada sector
(defrule openfileSectores
  (declare (salience 10))
  =>
  (open "AnalisisSectores.txt" datosSectores)
  (assert (SeguirLeyendoSectores))
)

(defrule LeerSectoresFromFile
  ?f <- (SeguirLeyendoSectores)
  =>
  (bind ?NombreSector (read datosSectores))
  (retract ?f)
  (if (neq ?NombreSector EOF) then
    (assert (Sector
      (Nombre ?NombreSector)
      (VariacionDia  (read datosSectores))
      (Capitalizacion (read datosSectores))
      (PER (read datosSectores))
      (RPD (read datosSectores))
      (PorcentajeIbex (read datosSectores))
      (Variacion5Dias (read datosSectores))
      (Bajada3Dias (read datosSectores))
      (Bajada5Dias (read datosSectores))
      (Variacion1Mes (read datosSectores))
      (Variacion3Meses (read datosSectores))
      (Variacion6Meses (read datosSectores))
      (Variacion1Ano (read datosSectores))))
    (assert (SeguirLeyendoSectores)))
)

(defrule closefileSectores
  (declare (salience -10))
  =>
  (close datosSectores)
)
; Termina el módulo para leer los datos de cada sector

; Empieza el módulo para leer la cartera del usuario

; Termina el módulo para leer la cartera del usuario
