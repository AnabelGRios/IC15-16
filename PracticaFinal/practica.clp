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

(deftemplate Noticia
  (field Nombre)
  (field Tipo)
  (field Dias)
  (field Fecha)
)

(deftemplate Inestable
	(field Nombre)
)

(deftemplate Peligroso
	(field Nombre)
)

(deftemplate Sobrevalorado
	(field Nombre)
)

(deftemplate  Infravalorado
	(field Nombre)
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
(defrule openfileCartera
  (declare (salience 10))
  =>
  (open "Cartera.txt" datosCartera)
  (assert (SeguirLeyendoCartera))
)

(defrule LeerCarteraFromFile
  ?f <- (SeguirLeyendoCartera)
  =>
  (bind ?NombreCartera (read datosCartera))
  (retract ?f)
  (if (neq ?NombreCartera EOF) then
    (assert (Cartera
      (Nombre ?NombreCartera)
      (Acciones  (read datosCartera))
      (ValorActual (read datosCartera))))
    (assert (SeguirLeyendoCartera)))
)

(defrule closefileCartera
  (declare (salience -10))
  =>
  (close datosCartera)
)
; Termina el módulo para leer la cartera del usuario

; Comienza el módulo para leer las noticias
(defrule openfileCartera
  (declare (salience 10))
  =>
  (open "Noticias.txt" datosNoticias)
  (assert (SeguirLeyendoNoticias))
)

(defrule LeerCarteraFromFile
  ?f <- (SeguirLeyendoNoticias)
  =>
  (bind ?NombreNoticia (read datosNoticias))
  (retract ?f)
  (if (neq ?NombreNoticia EOF) then
    (assert (Noticia
      (Nombre ?NombreNoticia)
      (Tipo  (read datosNoticias))
      (Dias (read datosNoticias))
      (Fecha (read datosNoticias))))
    (assert (datosNoticias)))
)

(defrule closefileCartera
  (declare (salience -10))
  =>
  (close datosNoticias)
)
; Termina el módulo para leer las noticias

; Empieza el módulo para deducir si un valor es estable o inestable
(defrule InestablePorSectorConst
	(Valor
		(Nombre ?NV)
		(Sector Construccion))
	(not (Inestable
		(Nombre ?NV)))
	=>
	(assert (Inestable
		(Nombre ?NV)))
)

(defrule InestablePorEconomia
	(Sector
		(Nombre Ibex)
		(Bajada5Dias true))
	(not (Inestable
		(Nombre Servicios)))
	=>
	(assert (Inestable
		(Nombre Servicios)))
)

(defrule InestablePorSector
	(Inestable
		(Nombre ?NS))
	(Valor
		(Nombre ?NV)
		(Sector ?NS))
	(not (Inestable
		(Nombre ?NV)))
	=>
	(assert (Inestable
		(Nombre ?NV)))
)

(defrule EstablePorNoticiaSector
	(Noticia
		(Nombre ?NS)
		(Tipo Buena))
	(Valor
		(Nombre ?NV)
		(Sector ?NS))
	?Borrar <- (Inestable
		(Nombre ?NV))
	=>
	(retract ?Borrar)
)

(defrule EstableSectorPorNoticiaSector
	(Noticia
		(Nombre ?NS)
		(Tipo Buena))
	?Borrar <- (Inestable
		(Nombre ?NS))
	=>
	(retract ?Borrar)
)

(defrule EstablePorNoticiaValor
	(Noticia
		(Nombre ?NV)
		(Tipo Buena))
	?Borrar <- (Inestable
		(Nombre ?NV))
	=>
	(retract ?Borrar)
)

(defrule InestablePorEconomia
	(Noticia
		(Nombre Ibex)
		(Tipo Mala))
	(Valor
		(Nombre ?NV))
	(not (Inestable
		(Nombre ?NV)))
	=>
	(assert (Inestable
		(Nombre ?NV)))
)

; Aquí termina el módulo para detectar valores estables e inestables

; Aquí comienza el módulo para detectar valores peligrosos
(defrule PeligrosoInestable
	(Cartera
		(Nombre ?NV))
	(Inestable
		(Nombre ?NV))
	(Valor
		(Nombre ?NV)
		(Bajada3Dias true))
	(not (Peligroso
		(Nombre ?NV)))
  =>
  (assert (Peligroso
		(Nombre ?NV)))
)

(defrule PeligrosoBajada5
	(Cartera
		(Nombre ?NV))
	(Valor
		(Nombre ?NV)
		(Bajada5Dias true)
		(Variacion5DiasSectorMenor5 false))
	(not (Peligroso
		(Nombre ?NV)))
	=>
	(assert (Peligroso
		(Nombre ?NV)))
)

; Aquí termina el módulo para detectar valores peligrosos

; Aquí empieza el módulo para detectar valores sobrevalorados
(defrule SobrevaloradoGeneral
	(Valor
		(Nombre ?NV)
		(EtiquetaPER Alto)
		(EtiquetaRPD Bajo))
	=>
	(assert (Sobrevalorado
		(Nombre ?NV)))
)

(defrule SobrevaloradoEmpPeq
	(Valor
		(Nombre ?NV)
		(Tamano PEQUENIA)
		(EtiquetaPER Alto))
	=>
	(assert (Sobrevalorado
		(Nombre ?NV)))
)

(defrule SobrevaloradoEmpPeq2
	(Valor
		(Nombre ?NV)
		(Tamano PEQUENIA)
		(EtiquetaPER Medio)
		(EtiquetaRPD Bajo))
	=>
	(assert (Sobrevalorado
		(Nombre ?NV)))
)

(defrule SobrevaloradoEmpGra
	(Valor
		(Nombre ?NV)
		(EtiquetaRPD Bajo)
		(or (EtiquetaPER Medio) (EtiquetaPER Alto)))
	=>
	(assert (Sobrevalorado
		(Nombre ?NV)))
)

(defrule SobrevaloradoEmpGra2
	(Valor
		(Nombre ?NV)
		(EtiquetaRPD Medio)
		(EtiquetaPER Alto))
	=>
	(assert (Sobrevalorado
		(Nombre ?NV)))
)

; Aquí termina el módulo para detectar valores sobrevalorados

; Aquí empieza el módulo para detectar valores infravalorados
(defrule InfravaloradoGeneral
	)
