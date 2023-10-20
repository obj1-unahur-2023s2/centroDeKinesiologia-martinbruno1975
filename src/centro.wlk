import aparatos.*
import pacientes.*

object centro {
	const aparatos = []
	const pacientes = #{}
	
	method agregarPaciente(unPaciente) {
		pacientes.add(unPaciente)
	}
	method agregarAparatos(listaAparatos){
		aparatos.addAll(listaAparatos)
	}
	method coloresDeAparatos(){
		return aparatos.map({a => a.color()}).asSet()
	}
	method pacientesMenoresDe8Anios(){
		return pacientes.filter({p => p.edad() < 8})
	}
	method cantidadDePacientesQueNoPuedenHacerRutina(){
		return pacientes.count({p => not p.puedeHacerLaRutina()})
	}
	method estaOptimo() = aparatos.all({a => not a.necesitaMantenimiento()})
	method estaComplicado() = self.aparatosParaMantenimiento().size() >= aparatos.size() / 2
	method aparatosParaMantenimiento() = aparatos.filter({a => a.necesitaMantenimiento()})
	method visitaTecnico() {
		self.aparatosParaMantenimiento().forEach({a => a.recibirMantenimiento()})
	}
}
