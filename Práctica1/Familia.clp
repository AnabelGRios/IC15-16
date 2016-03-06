(deftemplate Persona
	(field Sexo)
	(field Nombre)
)

(deftemplate RelacionDual
  (field Rel1)
  (field Rel2)
)

(deftemplate Relacion
  (field Rel)
  (field Nombre1)
  (field Nombre2)
)

(deftemplate Genero
  (field Sexo)
  (field Rel)
  (field RelGenero)
)

(deffacts Generos
  (Genero
    (Sexo Mujer)
    (Rel Padre)
    (RelGenero Madre))
  (Genero
    (Sexo Mujer)
    (Rel Madre)
    (RelGenero Madre))
  (Genero
    (Sexo Hombre)
    (Rel Madre)
    (RelGenero Padre))
  (Genero
    (Sexo Hombre)
    (Rel Padre)
    (RelGenero Padre))
  (Genero
    (Sexo Mujer)
    (Rel Abuelo)
    (RelGenero Abuela))
  (Genero
    (Sexo Mujer)
    (Rel Abuela)
    (RelGenero Abuela))
  (Genero
    (Sexo Hombre)
    (Rel Abuela)
    (RelGenero Abuelo))
  (Genero
    (Sexo Hombre)
    (Rel Abuelo)
    (RelGenero Abuelo))
  (Genero
    (Sexo Mujer)
    (Rel Primo)
    (RelGenero Prima))
  (Genero
    (Sexo Mujer)
    (Rel Prima)
    (RelGenero Prima))
  (Genero
    (Sexo Hombre)
    (Rel Prima)
    (RelGenero Primo))
  (Genero
    (Sexo Hombre)
    (Rel Primo)
    (RelGenero Primo))
  (Genero
    (Sexo Mujer)
    (Rel Hermano)
    (RelGenero Hermana))
  (Genero
    (Sexo Mujer)
    (Rel Hermana)
    (RelGenero Hermana))
  (Genero
    (Sexo Hombre)
    (Rel Hermana)
    (RelGenero Hermano))
  (Genero
    (Sexo Hombre)
    (Rel Hermano)
    (RelGenero Hermano))
  (Genero
    (Sexo Mujer)
    (Rel Tio)
    (RelGenero Tia))
  (Genero
    (Sexo Mujer)
    (Rel Tia)
    (RelGenero Tia))
  (Genero
    (Sexo Hombre)
    (Rel Tia)
    (RelGenero Tio))
  (Genero
    (Sexo Hombre)
    (Rel Tio)
    (RelGenero Tio))
  (Genero
    (Sexo Mujer)
    (Rel Nieto)
    (RelGenero Nieta))
  (Genero
    (Sexo Mujer)
    (Rel Nieta)
    (RelGenero Nieta))
  (Genero
    (Sexo Hombre)
    (Rel Nieta)
    (RelGenero Nieto))
  (Genero
    (Sexo Hombre)
    (Rel Nieto)
    (RelGenero Nieto))
  (Genero
    (Sexo Mujer)
    (Rel Sobrino)
    (RelGenero Sobrina))
  (Genero
    (Sexo Mujer)
    (Rel Sobrina)
    (RelGenero Sobrina))
  (Genero
    (Sexo Hombre)
    (Rel Sobrina)
    (RelGenero Sobrino))
  (Genero
    (Sexo Hombre)
    (Rel Sobrino)
    (RelGenero Sobrino))
  (Genero
    (Sexo Mujer)
    (Rel Hijo)
    (RelGenero Hija))
  (Genero
    (Sexo Mujer)
    (Rel Hija)
    (RelGenero Hija))
  (Genero
    (Sexo Hombre)
    (Rel Hijo)
    (RelGenero Hijo))
  (Genero
    (Sexo Hombre)
    (Rel Hija)
    (RelGenero Hijo))
)

(deffacts RelacionesDuales
  (RelacionDual
    (Rel1 Padre)
    (Rel2 Hijo))
  (RelacionDual
    (Rel1 Marido)
    (Rel2 Mujer))
  (RelacionDual
    (Rel1 Abuelo)
    (Rel2 Nieto))
  (RelacionDual
    (Rel1 Tio)
    (Rel2 Sobrino))
  (RelacionDual
    (Rel1 Primo)
    (Rel2 Primo))
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
	(Persona
		(Sexo Hombre)
		(Nombre Pedro))
	(Persona
		(Sexo Hombre)
		(Nombre Manuel))
)

(deffacts Relaciones
  (Relacion
    (Rel Casados)
    (Nombre1 Pedro)
    (Nombre2 Encarna))
  (Relacion
    (Rel Casados)
    (Nombre1 Manuel)
    (Nombre2 Carmen))
  (Relacion
    (Rel Casados)
    (Nombre1 Maria)
    (Nombre2 JuanManuel))
  (Relacion
    (Rel Casados)
    (Nombre1 Paco)
    (Nombre2 Rosi))
  (Relacion
    (Rel Casados)
    (Nombre1 Antonio)
    (Nombre2 Regi))
  (Relacion
    (Rel Padre)
    (Nombre1 JuanManuel)
    (Nombre2 JuanPedro))
  (Relacion
    (Rel Padre)
    (Nombre1 JuanManuel)
    (Nombre2 Elena))
  (Relacion
    (Rel Padre)
    (Nombre1 JuanManuel)
    (Nombre2 Anabel))
  (Relacion
    (Rel Padre)
    (Nombre1 Pedro)
    (Nombre2 Maria))
  (Relacion
    (Rel Padre)
    (Nombre1 Manuel)
    (Nombre2 JuanManuel))
  (Relacion
    (Rel Padre)
    (Nombre1 Paco)
    (Nombre2 Andres))
  (Relacion
    (Rel Padre)
    (Nombre1 Antonio)
    (Nombre2 David))
  (Relacion
    (Rel Padre)
    (Nombre1 Antonio)
    (Nombre2 Alvaro))
  (Relacion
    (Rel Padre)
    (Nombre1 Manuel)
    (Nombre2 Antonio))
  (Relacion
    (Rel Padre)
    (Nombre1 Manuel)
    (Nombre2 Paco))
  (Relacion
    (Rel Padre)
    (Nombre1 Manuel)
    (Nombre2 MariCarmen))
)

(defrule IntroducirRelacionDual
  (Relacion
    (Rel ?R1)
    (Nombre1 ?N1)
    (Nombre2 ?N2))
  (Genero
    (Sexo Hombre)
    (Rel ?R1)
    (RelGenero ?RH))
	(RelacionDual
		(Rel1 ?RH)
		(Rel2 ?R2))
  (Persona
    (Sexo ?S)
    (Nombre ?N2))
  (Genero
    (Sexo ?S)
    (Rel ?R2)
    (RelGenero ?RG))
  =>
  (assert (Relacion
    (Rel ?RG)
    (Nombre1 ?N2)
    (Nombre2 ?N1)))
)
