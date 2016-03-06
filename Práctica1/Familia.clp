(deftemplate Persona
	(field Sexo)
	(field Nombre)
)

(deftemplate Casados
	(field NombreMarido)
	(field NombreMujer)
)

(deftemplate Hijo
	(field NombreHijo)
	(field Nombre)
)

(deftemplate Hija
	(field NombreHija)
	(field Nombre)
)

(deftemplate Madre
	(field NombreMadre)
	(field Nombre)
)

(deftemplate Padre
	(field NombrePadre)
	(field Nombre)
)

(deffacts Personas
	(Persona
		(Sexo Mujer)
		(Nombre Maria))
	(Persona
		(Sexo Hombre)
		(Nombre JuanManuel))
	(Persona
		(Sexo Hombre)
		(Nombre JuanPedro))
	(Persona
		(Sexo Mujer)
		(Nombre Elena))
	(Persona 
		(Sexo Mujer)
		(Nombre Anabel))
	(Persona
		(Sexo Mujer)
		(Nombre Encarna))
	(Persona 
		(Sexo Mujer)
		(Nombre MariCarmen))
	(Persona
		(Sexo Hombre)
		(Nombre Paco))
	(Persona
		(Sexo Hombre)
		(Nombre Andres))
	(Persona 
		(Sexo Mujer)
		(Nombre Rosi))
	(Persona
		(Sexo Hombre)
		(Nombre Antonio))
	(Persona
		(Sexo Mujer)
		(Nombre Regi))
	(Persona
		(Sexo Hombre)
		(Nombre David))
	(Persona
		(Sexo Hombre)
		(Nombre Alvaro))
	(Persona
		(Sexo Mujer)
		(Nombre Carmen))
)

(deffacts RelacionCasados
	(Casados
		(NombreMujer Maria)
		(NombreMarido JuanManuel))
	(Casados
		(NombreMarido Paco)
		(NombreMujer Rosi))
	(Casados
		(NombreMarido Antonio)
		(NombreMujer Regi))
)

(deffacts RelacionHijo
	(Hijo
		(NombreHijo JuanPedro)
		(Nombre JuanManuel))
	(Hija
		(NombreHija Elena)
		(Nombre JuanManuel))
	(Hija 
		(NombreHija Anabel)
		(Nombre JuanManuel))
	(Hija 
		(NombreHija Maria)
		(Nombre Encarna))
	(Hijo 
		(NombreHijo Andres)
		(Nombre Paco))
	(Hijo
		(NombreHijo David)
		(Nombre Antonio))
	(Hijo
		(NombreHijo Alvaro)
		(Nombre Antonio))
	(Hijo
		(NombreHijo JuanManuel)
		(Nombre Carmen))
	(Hija
		(NombreHija MariCarmen)
		(Nombre Carmen))
	(Hijo
		(NombreHijo Antonio)
		(Nombre Carmen))
	(Hijo
		(NombreHijo Paco)
		(Nombre Carmen))
)

(defrule OtroPadre
	(Hijo
		(NombreHijo ?NH)
		(Nombre ?N))
	(Casados
		(NombreMarido ?N)
		(NombreMujer ?NM))
	=>
	(assert (Hijo
			(NombreHijo ?NH)
			(Nombre ?NM)))
	(assert (Madre
			(NombreMadre ?NM)
			(Nombre ?NH)))
	(assert (Padre
			(NombrePadre ?N)
			(Nombre ?NH)))
)

; Este no sé si funciona
(defrule OtroPadre2
	(Hijo
		(NombreHijo ?NH)
		(Nombre ?N))
	(Casados
		(NombreMarido ?NP)
		(NombreMujer ?N))
	=>
	(assert (Hijo
			(NombreHijo ?NH)
			(Nombre ?NP)))
)
