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

(deftemplate NuevaCartera
	(field Nombre)
	(field Acciones)
	(field ValorActual)
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
	(multifield Explicacion)
)

(deftemplate Propuesta
	(field Tipo)
	(field Valor)
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
		(Explicacion "peligrosa porque es inestable y ha estado perdiendo durante los ultimos tres dias")))
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
		(Explicacion "peligrosa porque ha estado perdiendo durante los últimos cinco días y además la variación con el sector ha sido mayor que un -5%")))
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
		(Explicacion "sobrevalorada porque el PER es alto y el RPD bajo")))
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
		(Explicacion "sobrevalorada porque la empresa es pequeña y el PER alto")))
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
		(Explicacion "sobrevalorada porque es pequeña, tiene el PER medio y el RPD bajo")))
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
		(Explicacion "sobrevalorada porque la empresa es grande, el PER medio o alto y el RPD bajo")))
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
		(Explicacion "sobrevalorada porque es grande, el PER es alto y el RPD mediano")))
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
	(Modulo
		(Numero Tres))
	(Valor
		(Nombre ?NV)
		(EtiquetaPER Bajo)
		(EtiquetaRPD Alto))
	=>
	(assert (Infravalorado
		(Nombre ?NV)
		(Explicacion "infravalorada porque el PER es bajo y el RPD alto")))
)

;Considero subir pero no mucho un 10%
(defrule InfravaloradoCaida
	(Modulo
		(Numero Tres))
	(Valor
		(Nombre ?NV)
		(VariacionPrecio3Meses ?VP3M)
		(VariacionPrecio6Meses ?VP6M)
		(VariacionPrecio1Ano ?VP1A)
		(VariacionPrecio1Mes ?VP1M)
		(EtiquetaPER Bajo))
	(or (< ?VP3M -30) (< ?VP6M -30) (< ?VP1A -30))
	(test (> ?VP1M 10))
	=>
	(assert (Infravalorado
		(Nombre ?NV)
		(Explicacion "infravalorada porque ha caido en los ultimos 3,6 o 12 meses, ha subido mas de un 10 en el ultimo mes y PER bajo")))
)

;Considero no estar bajando que no haya bajado en 5 días
;Considero que comportarse mejor que su sector es que la variacion de 5 dias con respecto al sector sea menor que 5
(defrule InfravaloradoGra
	(Modulo
		(Numero Tres))
	(Valor
		(Nombre ?NV)
		(Tamano GRANDE)
		(EtiquetaRPD Alto)
		(EtiquetaPER Mediano)
		(Bajada5Dias false)
		(Variacion5DiasSectorMenor5 false))
	=>
	(assert (Infravalorado
		(Nombre ?NV)
		(Explicacion "infravalorada porque es grande, RPD alto, PER mediano, no ha bajado en 5 dias y ha estado mejor que su sector esos 5 dias")))
)

(defrule SalirModulo3
	(declare (salience -1))
  ?f <- (Modulo (Numero Tres))
  =>
  (retract ?f)
  (assert (Modulo (Numero Cuatro)))
)
; Aquí termina el módulo para detectar valores infravalorados

; Aquí empieza el módulo de realización de propuestas

; Proponer invertir en empresas peligrosas
(defrule PropuestaPeligrosa
	(Modulo
		(Numero Cuatro))
	(Peligroso
		(Nombre ?NV)
		(Explicacion ?Pelig))
	(Valor
		(Nombre ?NV)
		(VariacionPrecio1Mes ?VP1M)
		(RPD ?RPD)
		(Sector ?NS))
	(Sector
		(Nombre ?NS)
		(Variacion1Mes ?VMS))
	(Cartera
		(Nombre ?NV))
	(test (< ?VP1M 0))
	(test (> (- ?VMS ?VP1M) 3))
	=>
	(bind ?Rend (- 20 (* 100 ?RPD)))
	(assert (Propuesta
		(Tipo VenderPeligrosa)
		(Valor ?NV)
		(Rendimiento ?Rend)
		(Explicacion (str-cat "la empresa es " ?Pelig
		", además está entrando en tendencia bajista con respecto a su sector. Según mi estimación existe una probabilidad no despreciable de que pueda caer al cabo del año un 20%, aunque produzca un "
		 ?RPD " por dividendos perderíamos un " ?Rend))))
)

; Proponer invertir en empresas infravaloradas
(defrule PropuestaInfravalorada
	(Modulo
		(Numero Cuatro))
	(Infravalorado
		(Nombre ?NV)
		(Explicacion ?Infr))
	(Valor
		(Nombre ?NV)
		(PER ?PER)
		(RPD ?RPD))
	(Cartera
		(Nombre DISPONIBLE)
		(ValorActual ?VA))
	(Sector
		(Nombre Ibex)
		(PER ?PERMedio))
	(test (> ?VA 0))
	=>
	(bind ?Rend (+ (/ (*  (- ?PERMedio ?PER) 20) ?PER) (* 100 ?RPD)))
	(assert (Propuesta
		(Tipo ComprarInfravalorado)
		(Valor ?NV)
		(Rendimiento ?Rend)
		(Explicacion (str-cat "esta empresa esta " ?Infr
		" y seguramente el PER tienda al PER medio en 5 años, con lo que deberia revalorizar un "
		?Rend " anual a lo que habria que sumar el " ?Rend "% de beneficios por dividendos"))))
)

; Proponer vender valores de empresas sobrevaloradas
; Tomo como rendimineto por año la suma de RPD y la variación del precio en 1 año
(defrule PropuestaVenderSobrevalorada
	(Modulo
		(Numero Cuatro))
	(Cartera
		(Nombre ?NV))
	(Valor
		(Nombre ?NV)
		(RPD ?RPD)
		(VariacionPrecio1Ano ?VA)
		(PER ?PER)
		(Sector ?NS))
	(Sector
		(Nombre ?NS)
		(PER ?PERMedio))
	(Sobrevalorado
		(Nombre ?NV)
		(Explicacion ?Sobr))
	(PrecioDelDinero ?PD)
	(test (< (+ ?VA (* 100 ?RPD)) (+ 5 ?PD)))
	=>
	(bind ?Rend (+ (* -100 ?RPD) (/ (- ?PER ?PERMedio) (* 5 ?PER))))
	(assert (Propuesta
		(Tipo VenderSobrevalorada)
		(Valor ?NV)
		(Rendimiento ?Rend)
		(Explicacion (str-cat "esta empresa esta " ?Sobr
		", es mejor amortizar lo invertido, ya que seguramente el PER tan alto debera bajar al PER medio del sector en unos 5 anios, con lo que se deberia devaluar un "
		?Rend " anual, asi que aunque se pierda el " ?RPD " de beneficios por dividendos, saldria rentable"))))
)

; Proponer cambiar una inversión a valores más rentables
; Tomo por revalorización por año esperado la variación del precio en el año anterior
; Controlo también además que no tenga ya valores de la empresa que voy a cambiar
(defrule PropuestaCambio
	(Modulo
		(Numero Cuatro))
	(Valor
		(Nombre ?Empresa2)
		(VariacionPrecio1Ano ?VA2)
		(RPD ?RPD2))
	(not (Infravalorado
		(Nombre ?Empresa2)))
	(Cartera
		(Nombre ?Empresa2))
	(Valor
		(Nombre ?Empresa1)
		(RPD ?RPD1))
	(not (Sobrevalorado
		(Nombre ?Empresa1)))
	(not (Cartera
		(Nombre ?Empresa1)))
	(test (> (* 100 ?RPD1) (+ 1 (+ ?VA2 (* 100 ?RPD2)))))
	=>
	(bind ?Rend (- (* 100 ?RPD1) (+ (+ ?VA2 (* 100 ?RPD2)) 1)))
	(assert (Propuesta
		(Tipo Cambio)
		(Valor (str-cat ?Empresa2 " por " ?Empresa1))
		(Rendimiento ?Rend)
		(Explicacion (str-cat ?Empresa1 " debe tener una revalorizacion acorde con la evolucion de la bolsa. Por dividendos se espera un un "
		?RPD1 ", que es mas de lo que esta dando " ?Empresa2
		", por lo que propongo cambiar los valores por los de esta otra, aunque se pague el 1% del coste del cambio saldria rentable"))))
	)

	(defrule SalirModulo4
		(declare (salience -1))
	  ?f <- (Modulo (Numero Cuatro))
	  =>
	  (retract ?f)
	  (assert (Modulo (Numero Cinco)))
		(assert (ContadorMostradas 0))
	)

; Aquí termina el módulo de realización de propuestas

; Aquí empieza el módulo de elección de propuestas. En este módulo se van a elegir las
; cinco mejores propuestas (aquellas que tengan mejor rendimiento) y se preguntará al
; usuario si quiere comprar/vender y cuántas acciones
(defrule FindMax
	(Modulo
		(Numero Cinco))
	(ContadorMostradas ?CM)
  (Propuesta
		(Valor ?NV1)
		(Rendimiento ?R1))
  (not  (and (Propuesta (Rendimiento ?R2)) (test(> ?R2 ?R1))))
	(test (< ?CM 5))
  =>
  (assert (Max ?NV1 ?R1))
)

(defrule MostrarMax
	(Modulo
		(Numero Cinco))
	?f <- (Max ?NV ?R)
	?f3 <- (Propuesta
		(Valor ?NV)
		(Tipo ?T)
		(Explicacion ?Exp))
	?f2 <- (ContadorMostradas ?CM)
	=>
	(bind ?CM2 (+ ?CM 1))
	(printout t "Se recomienda una propuesta de tipo " ?T " " ?NV " con rendimiento " ?R " ya que " ?Exp crlf)
	(retract ?f)
	(retract ?f2)
	(retract ?f3)
	(assert (ContadorMostradas ?CM2))
)

(defrule PedirAccion
	(declare (salience -1))
	(Modulo
		(Numero Cinco))
	=>
	(printout t "¿Desea realizar alguna de estas acciones? Introduzca Vender para una propuesta
	de tipo vender, Comprar para una propuesta de tipo comprar, Cambio para una propuesta de tipo
	Cambio y Salir para no realizar ningún movimiento y salir." crlf)
	(bind ?Respuesta (read))
	(assert (RespuestaUsuario ?Respuesta))
)

(defrule PedirAccionVender
	(Modulo
		(Numero Cinco))
	?f <- (RespuestaUsuario Vender)
	=>
	(printout t "Indique que valor desea vender" crlf)
	(bind ?ValorVender (read))
	(printout t "Indique cuantas acciones desea vender" crlf)
	(bind ?NumAcciones (read))
	(assert (Vender ?ValorVender ?NumAcciones))
	(retract ?f)
)

(defrule PedirAccionComprar
	(Modulo
		(Numero Cinco))
	?f <- (RespuestaUsuario Comprar)
	=>
	(printout t "Indique que valor desea comprar" crlf)
	(bind ?ValorComprar (read))
	(printout t "Indique cuantas acciones desea comprar" crlf)
	(bind ?NumAcciones (read))
	(assert (Comprar ?ValorComprar ?NumAcciones))
	(retract ?f)
)

(defrule PedirAccionCambio
	(Modulo
		(Numero Cinco))
	?f <- (RespuestaUsuario Cambio)
	=>
	(printout t "Indique que valor desea vender" crlf)
	(bind ?ValorVender (read))
	(printout t "Indique cuantas acciones desea vender" crlf)
	(bind ?NumAccionesVender (read))
	(printout t "Indique que valor desea comprar" crlf)
	(bind ?ValorComprar (read))
	(printout t "Indique cuantas acciones desea comprar" crlf)
	(bind ?NumAccionesComprar (read))
	(assert (Vender ?ValorVender ?NumAccionesVender))
	(assert (Comprar ?ValorComprar ?NumAccionesComprar))
	(retract ?f)
)

(defrule CambiarCarteraVender
	(declare (salience -1))
	(Modulo
		(Numero Cinco))
	?f <- (Vender ?ValorVender ?NumAcciones)
	?f2 <- (Cartera
		(Nombre ?ValorVender)
		(Acciones ?NA))
	(Valor
		(Nombre ?ValorVender)
		(Precio ?Precio))
	?f3 <- (Cartera
		(Nombre DISPONIBLE)
		(Acciones ?DisponibleActual))
	(test (<= ?NumAcciones ?NA))
	=>
	(bind ?Dif (- ?NA ?NumAcciones))
	(bind ?NuevoDisponible (+ ?DisponibleActual (* ?NumAcciones ?Precio)))
	(bind ?NuevaCantidadEnValor (* ?Dif ?Precio))
	(retract ?f)
	(retract ?f2)
	(retract ?f3)
	(assert (Cartera
		(Nombre DISPONIBLE)
		(Acciones ?NuevoDisponible)
		(ValorActual ?NuevoDisponible)))
	(if (> ?Dif 0) then
		(assert (Cartera
			(Nombre ?ValorVender)
			(Acciones ?Dif)
			(ValorActual ?NuevaCantidadEnValor))))
)

(defrule ErrorVender
	(declare (salience -1))
	(Modulo
		(Numero Cinco))
	?f <- (Vender ?ValorVender ?NumAcciones)
	(Cartera
		(Nombre ?ValorVender)
		(Acciones ?NA))
	(test (> ?NumAcciones ?NA))
	=>
	(retract ?f)
	(printout t "No se disponen de tantas acciones como desea vender" clrf)
)

(defrule CambiarCarteraComprar
	(declare (salience -2))
	(Modulo
		(Numero Cinco))
	?f <- (Comprar ?ValorComprar ?NumAcciones)
	(Valor
		(Nombre ?ValorComprar)
		(Precio ?Precio))
	?f2 <- (Cartera
		(Nombre DISPONIBLE)
		(Acciones ?DisponibleActual))
	(not (Cartera
		(Nombre ?ValorComprar)))
	(test (<= (* ?NumAcciones ?Precio) ?DisponibleActual))
	=>
	(bind ?NuevaCantidad (* ?NumAcciones ?Precio))
	(bind ?NuevoDisponible (- ?DisponibleActual (* ?NumAcciones ?Precio)))
	(retract ?f)
	(retract ?f2)
	(assert (Cartera
		(Nombre DISPONIBLE)
		(Acciones ?NuevoDisponible)
		(ValorActual ?NuevoDisponible)))
	(assert (Cartera
		(Nombre ?ValorComprar)
		(Acciones ?NumAcciones)
		(ValorActual ?NuevaCantidad)))
)

(defrule CambiarCarteraComprarExistente
	(declare (salience -2))
	(Modulo
		(Numero Cinco))
	?f <- (Comprar ?ValorComprar ?NumAcciones)
	(Valor
		(Nombre ?ValorComprar)
		(Precio ?Precio))
	?f2 <- (Cartera
		(Nombre DISPONIBLE)
		(Acciones ?DisponibleActual))
	?f3 <- (Cartera
		(Nombre ?ValorComprar)
		(Acciones ?NumAccionesActual))
	(test (<= (* ?NumAcciones ?Precio) ?DisponibleActual))
	=>
	(bind ?NuevaCantidad (* (+ ?NumAccionesActual ?NumAcciones) ?Precio))
	(bind ?NuevoDisponible (- ?DisponibleActual (* ?NumAcciones ?Precio)))
	(bind ?NuevasAcciones (+ ?NumAcciones ?NumAccionesActual))
	(retract ?f)
	(retract ?f2)
	(retract ?f3)
	(assert (Cartera
		(Nombre DISPONIBLE)
		(Acciones ?NuevoDisponible)
		(ValorActual ?NuevoDisponible)))
	(assert (Cartera
		(Nombre ?ValorComprar)
		(Acciones ?NuevasAcciones)
		(ValorActual ?NuevaCantidad)))
)

(defrule ErrorComprar
	(declare (salience -2))
	(Modulo
		(Numero Cinco))
	?f <- (Comprar ?ValorComprar ?NumAcciones)
	(Valor
		(Nombre ?ValorComprar)
		(Precio ?Precio))
	(Cartera
		(Nombre DISPONIBLE)
		(Acciones ?DisponibleActual))
	(test (> (* ?NumAcciones ?Precio) ?DisponibleActual))
	=>
	(retract ?f)
	(printout t "No se dispone de dinero suficiente para comprar tantas acciones" crlf)
)

(defrule EliminarPropuestas
	(declare (salience -3))
	(Modulo
		(Numero Cinco))
	?f <- (Propuesta
		(Valor ?NV))
	=>
	(retract ?f)
	(assert (Volver Modulo1))
)

(defrule SalirModulo5
	(declare (salience -4))
	?f <- (Modulo (Numero Cinco))
	?f2 <- (ContadorMostradas 5)
	?f3 <- (Volver Modulo1)
	=>
	(retract ?f)
	(retract ?f2)
	(retract ?f3)
	(assert (Modulo (Numero Uno)))
)

(defrule SalirPrograma
	(declare (salience -2))
	(Modulo (Numero Cinco))
	(RespuestaUsuario Salir)
	=>
	(exit))

; Aquí termina el módulo de elección de propuestas
