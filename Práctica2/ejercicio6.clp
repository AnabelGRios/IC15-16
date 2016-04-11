(deftemplate TTT
	(slot NombreSlot1)
	(slot NombreSlot2)
	(multislot NombreMultiSlot)
)

(defrule GuardarHecho
	=>
	(printout t "Introduzca la primera palabra:" crlf)
	(bind ?NS1 (read) )
	(printout t "Introduzca la segunda palabra:" crlf)
	(bind ?NS2 (read))
	(printout t "Introduzca el resto de palabras:" crlf)
	(bind ?NMS (readline))
	(bind ?NM (str-explode ?NMS))
	(assert (TTT
		(NombreSlot1 ?NS1)
		(NombreSlot2 ?NS2)
		(NombreMultiSlot ?NM)))
)
