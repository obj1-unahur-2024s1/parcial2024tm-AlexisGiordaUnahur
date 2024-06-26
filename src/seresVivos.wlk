import materias.*
import casas.*
import hechizos.*

class SerVivo{
	var salud
	
	method salud() = salud
	method aumentarSalud(cantidad){salud+=cantidad}
	method disminuirSalud(cantidad){salud=0.max(salud-cantidad)}
	method recibirHechizo_De_(hechizo,atacante){self.disminuirSalud(hechizo.danio())}
}

class CriaturaMagica inherits SerVivo{
	//abstracta
}

class CriaturaInmune inherits CriaturaMagica{
	override method recibirHechizo_De_(hechizo,atacante){
		super(hechizo,atacante)
		atacante.aumentarSalud(hechizo.danio())
	}
}

class Estudiante inherits SerVivo{
	var casa
	const property esPuraSangre
	var habilidad = 0
	const property hechizosAprendidos = []
	const property materiasInscritas = []
	
	method casa() = casa
	method cambiarCasa(otraCasa){casa=otraCasa}
	method habilidad() = habilidad
	method aumentarHabilidadEnUno(){habilidad+=1}
	method disminuirHabilidadEnUno(){
		if(habilidad-1 > 0) habilidad-1
		else self.error("la habilidad no puede disminuir mas")
	}
	method esExperimentado() = habilidad>10
	method inscribirse(materia){
		self.materiasInscritas().add(materia)
		materia.agregarAlumno(self)
	}
	method darseDeBaja(materia){
		if(materiasInscritas.contains(materia)) materiasInscritas.remove(materia)
		else self.error("no esta inscrito en esta materia")
	}
	method aprender(hechizo){
		if(not hechizosAprendidos.contains(hechizo) ){
			if(hechizo.loPuedeAprender(self)){
				hechizosAprendidos.add(hechizo)
				self.aumentarHabilidadEnUno()
			}
			else{
				self.error("el hechizo no se puede aprender")
			}
		}else{
			self.error("el hechizo ya se aprendio")
		}
	}
	
	method lanzarHechizo(objetivo,hechizo){
		if(hechizosAprendidos.contains(hechizo))
			hechizo.serLanzadoA_Por_(objetivo,self)
		else 
			self.error("el alumno no sabe usar este hechizo")
	}
}