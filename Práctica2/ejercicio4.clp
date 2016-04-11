(deftemplate Hecho
	(field NombreHecho)
	(field AtributoHecho)
)

(deftemplate ContarHechos
	(field NombreHecho)
)

(deftemplate NumeroHechos
	(field NombreHecho)
	(field numero)
)

; Controla si ya se ha contado un hecho
(deftemplate HechoYaContado
	(field NombreHecho)
	(field AtributoHecho)
)

(defrule AnadirContador
	(ContarHechos
		(NombreHecho ?NombreHecho))
	(not (NumeroHechos
		(NombreHecho ?NombreHecho)))
	=>
	(assert (NumeroHechos
		(NombreHecho ?NombreHecho)
		(numero 0)))
)

(defrule IncrementaContador
	?F<-(NumeroHechos
		(NombreHecho ?NombreHecho)
		(numero ?num))
	(Hecho
		(NombreHecho ?NombreHecho)
		(AtributoHecho ?atributo))
	(not (HechoYaContado
		(NombreHecho ?NombreHecho)
		(AtributoHecho ?atributo)))
	=>
	(bind ?num (+ ?num 1))
	(assert (NumeroHechos
		(NombreHecho ?NombreHecho)
		(numero ?num)))
	(assert (HechoYaContado
		(NombreHecho ?NombreHecho)
		(AtributoHecho ?atributo)))
	(retract ?F)
)

(defrule MostrarContador
	(declare (salience -1))
	(NumeroHechos
		(NombreHecho ?NombreHecho)
		(numero ?num))
	=>
	(printout t "Hay " ?num " hechos del hecho " ?NombreHecho crlf)
)

(deffacts HechosPrueba
	(Hecho
		(NombreHecho Hecho1)
		(AtributoHecho atributo1))
	(Hecho
		(NombreHecho Hecho1)
		(AtributoHecho atributo2))
	(Hecho
		(NombreHecho Hecho2)
		(AtributoHecho atributo3))
	(Hecho
		(NombreHecho Hecho2)
		(AtributoHecho atributo4))
	(Hecho
		(NombreHecho Hecho2)
		(AtributoHecho atributo5))
)
