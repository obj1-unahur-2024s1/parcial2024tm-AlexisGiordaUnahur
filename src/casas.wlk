import seresVivos.*

class Casa{
	method esPeligroso(alumno) = not alumno.salud()==0
}

object gryffindor inherits Casa{
	
	override method esPeligroso(alumno) = false
}

object slytherin inherits Casa{
	
	//override method esPeligroso(alumno) = super(alumno) and true
}

object ravenclaw inherits Casa {
	
	override method esPeligroso(alumno) = super(alumno) and alumno.esExperimentado()
}

object hufflepuff inherits Casa{
	
	override method esPeligroso(alumno) = super(alumno) and alumno.esPuraSangre()
}
