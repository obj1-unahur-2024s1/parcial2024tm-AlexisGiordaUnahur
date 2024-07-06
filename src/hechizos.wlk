import seresVivos.*
import materias.*
import casas.*

class Hechizo{
	const property dificultad
	
	method loPuedeAprender(alumno) = alumno.habilidad()>dificultad
	method danio() = dificultad + 10
	method serLanzadoA_Por_(objetivo,alumno){objetivo.recibirHechizo_De_(self,alumno)}
}

class HechizoImperdonable inherits Hechizo{
	const property danioPropio
	
	override method danio() = super() * 2
	override method serLanzadoA_Por_(objetivo,alumno){
		super(objetivo,alumno)
		alumno.disminuirSalud(danioPropio)
	}
}

class HechizoParaNoPeligroso inherits Hechizo{
	override method loPuedeAprender(alumno) = not alumno.casa().esPeligroso(alumno)
	override method serLanzadoA_Por_(objetivo,alumno){
		super(objetivo,alumno)
		alumno.disminuirHabilidadEnUno()
	}
}

class HechizoFeliz inherits Hechizo{
	override method loPuedeAprender(alumno) = alumno.esPuraSangre()
	override method serLanzadoA_Por_(objetivo,alumno){
		super(objetivo,alumno)
		alumno.cambiarCasa(gryffindor)
	}
}

class HechizoTriste inherits Hechizo{
	override method loPuedeAprender(alumno) =not alumno.esPuraSangre()
	override method serLanzadoA_Por_(objetivo,alumno){
		super(objetivo,alumno)
		alumno.cambiarCasa(slytherin)
	}
}