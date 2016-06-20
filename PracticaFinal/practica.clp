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
)

(deftemplate Inestable
	(field Nombre)
)

(deftemplate Peligroso
	(field Nombre)
	(multifield Explicacion)
)

(deftemplate Sobrevalorado
	(field Nombre)
	(multifield Explicacion)
)

(deftemplate  Infravalorado
	(field Nombre)
)

(deftemplate Propuesta
	(field Tipo)
	(field Rendimiento)
	(multifield Explicacion)
)

(deffacts PrecioDelDinero
	(PrecioDelDinero 0))

	(deftemplate Modulo
		(field Numero)
	)

; Empieza el módulo para leer los datos de cada valor en el mercado
(defrule openfile
  (declare (salience 50))
  =>
  (open "Analisis.txt" datosValores)
  (assert (SeguirLeyendoValores))
)

(defrule LeerValoresCierreFromFile
	(declare (salience 49))
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
  (declare (salience 48))
  =>
  (close datosValores)
)
; Termina el módulo para leer los datos de cada valor

; Empieza el módulo para leer los datos de cada sector
(defrule openfileSectores
  (declare (salience 47))
  =>
  (open "AnalisisSectores.txt" datosSectores)
  (assert (SeguirLeyendoSectores))
)

(defrule LeerSectoresFromFile
	(declare (salience 46))
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
  (declare (salience 45))
  =>
  (close datosSectores)
)
; Termina el módulo para leer los datos de cada sector

; Empieza el módulo para leer la cartera del usuario
(defrule openfileCartera
  (declare (salience 44))
  =>
  (open "Cartera.txt" datosCartera)
  (assert (SeguirLeyendoCartera))
)

(defrule LeerCarteraFromFile
	(declare (salience 43))
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
  (declare (salience 42))
  =>
  (close datosCartera)
)
; Termina el módulo para leer la cartera del usuario

; Comienza el módulo para leer las noticias
(defrule openfileNoticias
  (declare (salience 41))
  =>
  (open "Noticias.txt" datosNoticias)
  (assert (SeguirLeyendoNoticias))
)

(defrule LeerNoticasFromFile
	(declare (salience 40))
  ?f <- (SeguirLeyendoNoticias)
  =>
  (bind ?NombreNoticia (read datosNoticias))
  (retract ?f)
  (if (neq ?NombreNoticia EOF) then
    (assert (Noticia
      (Nombre ?NombreNoticia)
      (Tipo  (read datosNoticias))
      (Dias (read datosNoticias))))
    (assert (SeguirLeyendoNoticias)))
)

(defrule closefileNoticas
  (declare (salience 39))
  =>
  (close datosNoticias)
)

; Termina el módulo para leer las noticias

; Empieza el módulo para deducir si un valor es estable o inestable
(defrule Modulo0
  (declare (salience 38))
  =>
  (assert (Modulo
		(Numero Cero)))
)

(defrule InestablePorSectorConst
	(Modulo
		(Numero Cero))
	(Valor
		(Nombre ?NV)
		(Sector Construccion))
	=>
	(assert (Inestable
		(Nombre ?NV)))
)

(defrule InestableServiciosPorEconomia
	(Modulo
		(Numero Cero))
	(Sector
		(Nombre Ibex)
		(Bajada5Dias true))
	=>
	(assert (Inestable
		(Nombre Servicios)))
)

(defrule InestablePorSector
	(Modulo
		(Numero Cero))
	(Inestable
		(Nombre ?NS))
	(Valor
		(Nombre ?NV)
		(Sector ?NS))
	=>
	(assert (Inestable
		(Nombre ?NV)))
)

(defrule EstablePorNoticiaSector
	(Modulo
		(Numero Cero))
	(Noticia
		(Nombre ?NS)
		(Tipo Buena))
	(Valor
		(Nombre ?NV)
		(Sector ?NS))
	(not (Noticia
		(Nombre ?NV)
		(Tipo Mala)))
	?Borrar <- (Inestable
		(Nombre ?NV))
	=>
	(retract ?Borrar)
)

(defrule EstableSectorPorNoticiaSector
	(Modulo
		(Numero Cero))
	(Noticia
		(Nombre ?NS)
		(Tipo Buena))
	?Borrar <- (Inestable
		(Nombre ?NS))
	=>
	(retract ?Borrar)
)

(defrule EstablePorNoticiaValor
	(Modulo
		(Numero Cero))
	(Noticia
		(Nombre ?NV)
		(Tipo Buena))
	?Borrar <- (Inestable
		(Nombre ?NV))
	=>
	(retract ?Borrar)
)

(defrule InestablePorNoticia
	(Modulo
		(Numero Cero))
	(Noticia
		(Nombre ?NV)
		(Tipo Mala))
	=>
	(assert (Inestable
		(Nombre ?NV)))
)

(defrule InestablePorEconomia
	(Modulo
		(Numero Cero))
	(Noticia
		(Nombre Ibex)
		(Tipo Mala))
	(Valor
		(Nombre ?NV))
	=>
	(assert (Inestable
		(Nombre ?NV)))
)

(defrule SalirModulo0
	(declare (salience -1))
  ?f <- (Modulo (Numero Cero))
  =>
  (retract ?f)
  (assert (Modulo (Numero Uno)))
)

; Aquí termina el módulo para detectar valores estables e inestables

; Aquí comienza el módulo para detectar valores peligrosos
(defrule PeligrosoInestable
	(Modulo
		(Numero Uno))
	(Cartera
		(Nombre ?NV))
	(Inestable
		(Nombre ?NV))
	(Valor
		(Nombre ?NV)
		(Bajada3Dias true))
  =>
  (assert (Peligroso
		(Nombre ?NV)
		(Explicacion "Peligroso porque es inestable y ha estado perdiendo durante los últimos tres días")))
)

(defrule PeligrosoBajada5
	(Modulo
		(Numero Uno))
	(Cartera
		(Nombre ?NV))
	(Valor
		(Nombre ?NV)
		(Bajada5Dias true)
		(Variacion5DiasSectorMenor5 false))
	=>
	(assert (Peligroso
		(Nombre ?NV)
		(Explicacion "Peligroso porque ha estado perdiendo durante los últimos cinco días y además la variación con el sector ha sido mayor que un -5%")))
)

(defrule SalirModulo1
	(declare (salience -1))
  ?f <- (Modulo (Numero Uno))
  =>
  (retract ?f)
  (assert (Modulo (Numero Dos)))
)

; Aquí termina el módulo para detectar valores peligrosos

; Aquí empieza el módulo para detectar valores sobrevalorados
(defrule SobrevaloradoGeneral
	(Modulo
		(Numero Dos))
	(Valor
		(Nombre ?NV)
		(EtiquetaPER Alto)
		(EtiquetaRPD Bajo))
	(not (Sobrevalorado
		(Nombre ?NV)))
	=>
	(assert (Sobrevalorado
		(Nombre ?NV)
		(Explicacion "Sobrevalorada porque el PER es alto y el RPD bajo")))
)

(defrule SobrevaloradoEmpPeq
	(Modulo
		(Numero Dos))
	(Valor
		(Nombre ?NV)
		(Tamano PEQUENIA)
		(EtiquetaPER Alto))
	(not (Sobrevalorado
		(Nombre ?NV)))
	=>
	(assert (Sobrevalorado
		(Nombre ?NV)
		(Explicacion "Sobrevalorado porque la empresa es pequeña y el PER alto")))
)

(defrule SobrevaloradoEmpPeq2
	(Modulo
		(Numero Dos))
	(Valor
		(Nombre ?NV)
		(Tamano PEQUENIA)
		(EtiquetaPER Medio)
		(EtiquetaRPD Bajo))
	(not (Sobrevalorado
		(Nombre ?NV)))
	=>
	(assert (Sobrevalorado
		(Nombre ?NV)
		(Explicacion "Sobrevalorada porque es pequeña, tiene el PER medio y el RPD bajo")))
)

(defrule SobrevaloradoEmpGra
	(Modulo
		(Numero Dos))
	(Valor
		(Nombre ?NV)
		(Tamano GRANDE)
		(EtiquetaRPD Bajo)
		(EtiquetaPER Medio|Alto))
	(not (Sobrevalorado
		(Nombre ?NV)))
	=>
	(assert (Sobrevalorado
		(Nombre ?NV)
		(Explicacion "Sobrevalorado porque la empresa es grande, el PER medio o alto y el RPD bajo")))
)

(defrule SobrevaloradoEmpGra2
	(Modulo
		(Numero Dos))
	(Valor
		(Nombre ?NV)
		(Tamano GRANDE)
		(EtiquetaRPD Medio)
		(EtiquetaPER Alto))
	(not (Sobrevalorado
		(Nombre ?NV)))
	=>
	(assert (Sobrevalorado
		(Nombre ?NV)
		(Explicacion "Sobrevalorado porque es grande, el PER es alto y el RPD mediano")))
)

(defrule SalirModulo2
	(declare (salience -1))
  ?f <- (Modulo (Numero Dos))
  =>
  (retract ?f)
  (assert (Modulo (Numero Tres)))
)

; Aquí termina el módulo para detectar valores sobrevalorados

; Aquí empieza el módulo para detectar valores infravalorados
(defrule InfravaloradoGeneral
	(Valor
		(Nombre ?NV)
		(EtiquetaPER Bajo)
		(EtiquetaRPD Alto))
	=>
	(assert (Infravalorado
		(Nombre ?NV)))
)

;Considero subir pero no mucho un 5%
(defrule InfravaloradoCaida
	(Valor
		(Nombre ?NV)
		(or (< (VariacionPrecio3Meses) -30) (< (VariacionPrecio6Meses) -30) (> (VariacionPrecio1Ano) 30))
		(> (VariacionPrecio1Mes) 5)
		(EtiquetaPER Bajo))
	=>
	(assert (Infravalorado
		(Nombre ?NV)))
)

;Considero no estar bajando que no haya bajado en 5 días
;Considero que comportarse mejor que su sector es que var5dias - varsector5dias
;sea positivo
(defrule InfravaloradoGra
	(Valor
		(Nombre ?NV)
		(EtiquetaRPD Alto)
		(EtiquetaPER Mediano)
		(Bajada5Dias false)
		(> (Variacion5DiasSector) 0))
	=>
	(assert (Infravalorado
		(Nombre ?NV)))
)

; Aquí termina el módulo para detectar valores infravalorados

; Aquí empieza el módulo de realización de propuestas

; Proponer invertir en empresas peligrosas
(defrule PropuestaPeligrosa
	(Modulo
		(Numero Cuatro))
	(Peligroso
		(Nombre ?NV))
	(Sector
		(Nombre ?NV)
		(Variacion1Mes ?VMS))
	(Valor
		(Nombre ?NV)
		(VariacionPrecio1Mes ?VP1M)
		(RPD ?RPD))
	(Cartera
		(Nombre Disponible)
		(ValorActual ?VA))
	(test (< ?VP1M 0))
	(test (> (- ?VMS ?VP1M) 3))
	(test (> ?VA 0))
	=>
	(assert (Propuesta
		(Tipo ComprarPeligrosa)
		(Rendimiento (- 20 (?RPD)))
		(Explicacion "La empresa es peligrosa por... Además está entrando en tendencia
		 bajista con respecto a su sector. Según mi estimación existe una probabilidad
		 no despreciable de que pueda caer al cabo del año un 20%, aunque producza un
		 rpd por dividendos perderíamos un 20-rpd%")))
)

; Proponer invertir en empresas infravaloradas
(defrule PropuestaInfravalorada
	(Modulo
		(Numero Cuatro))
	(Infravalorado
		(Nombre ?NV))
	(Valor
		(Nombre ?NV)
		(PER ?PEREM)
		(RPD ?RPD))
	(Cartera
		(Nombre Disponible)
		(ValorActual ?VA))
	(Sector
		(Nombre Ibex)
		(PER ?PERM))
	(test (> ?VA 0))
	=>
	(assert (Propuesta
		(Tipo ComprarInfravalorado)
		(Rendimiento (+ (/ (*  (- ?PERM ?PEREM) 20) ?PEREM) ?RPD))
		(Explicacion "Esta empresa está infravalorada y seguramente el PER tienda al PER
		medio en 5 años, con lo que debería revalorizar un RE anual a lo que habría que
		sumar el RPD% de beneficios por dividendos")))
)

; Proponer vender valores de empresas sobrevaloradas
; Tomo como rendimineto por año la suma de RPD y la variación del precio en 1 año
(defrule PropuestaVenderSobrevalorada
	(Modulo
		(Numero Cuatro))
	(Cartera
		(Nombre ?NV))
	(Sobrevalorado
		(Nombre ?NV)
		(RPD ?RPD)
		(VariacionPrecio1Ano ?VA))
	(PrecioDelDinero ?PD)
	(test (< (+ ?VA ?RPD) (+ 5 ?PD)))
	=>
	(assert (Propuesta
		(Tipo VenderSobrevalorada)
		(Rendimiento ))))
