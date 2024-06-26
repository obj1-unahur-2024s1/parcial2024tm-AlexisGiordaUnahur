import seresVivos.*
import hechizos.*
import casas.*

class Materia{
	const property profesor
	var hechizoEnseniado
	const property alumnos = []
	
	method agregarAlumno(alumno){alumnos.add(alumno)}
	method dictar(){alumnos.forEach({a=>a.aprender(hechizoEnseniado)})}
	method hacerPractica(criatura){alumnos.forEach({a=>a.lanzarHechizo(criatura,hechizoEnseniado)})}
	method hechizoEnseniado() = hechizoEnseniado
	method cambiarHechizo(nuevoHechizo){hechizoEnseniado=nuevoHechizo}
}