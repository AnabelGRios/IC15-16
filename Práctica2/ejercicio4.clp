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

(deftemplate IncrementaContador
	(field NombreHecho)
)

; Tantos como hechos distintos haya
(defglobal ?*contador1* = 0)
(defglobal ?*contador2* = 0)

(defrule ContadorHechos
	(Hecho ?NombreHecho)
	(ContarHechos ?NombreHecho)
	=>
	(assert (IncrementaContador
		(NombreHecho ?NombreHecho)))
)

; Uno para cada uno de los hechos. Esto tiene que haber otra forma más bonita de hacerlo
(defrule IncrementarContador
	(IncrementaContador Hecho1)
	=>
	(bind ?*contador1* (+ ?*contador1* 1))

)

; A esta regla hay que ponerle que se ejecute la última
; Una para cada uno de los hechos. Tiene que haber otra forma
(defrule AnadirContador
	(ContarHechos Hecho1)
	=>
	(assert (NumeroHechos
		(NombreHecho Hecho1)
		(numero ?*contador1*)))
)
