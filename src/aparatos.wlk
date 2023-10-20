import pacientes.*

class Aparato {
	const property color = "blanco"
	
	method usar(paciente)
	method puederSerUsadoPor(paciente)
	method efectoDelUso(unPaciente)
	method necesitaMantenimiento() = false
	method recibirMantenimiento() {}
}

class Magneto inherits Aparato {
	var imantacion = 800
	
	override method usar(paciente) {
		paciente.dolor(paciente.dolor() * 0.1)
	}
	override method puederSerUsadoPor(paciente) = true
	override method efectoDelUso(unPaciente){
		imantacion = 0.max(imantacion - 1)
	}
	override method necesitaMantenimiento() = imantacion < 100
	override method recibirMantenimiento(){
		imantacion = 800.min(imantacion + 500)
	}
}

class Bicicleta inherits Aparato {
	var cantidadTornillos = 0
	var cantidadAceite = 0
	
	override method usar(paciente){
		paciente.dolor(4)
		paciente.fortaleza(3)
	}
	
	override method puederSerUsadoPor(paciente) = paciente.edad() > 8
	override method efectoDelUso(unPaciente){
		if(unPaciente.dolor() > 30){
			cantidadTornillos++
		}
		if(unPaciente.edad().between(30,50)){
			cantidadAceite++
		}
	}
	override method necesitaMantenimiento() = cantidadTornillos >= 10 || cantidadAceite >= 5
	override method recibirMantenimiento(){
		cantidadTornillos = 0
		cantidadAceite = 0
	}
}

class Minitramp inherits Aparato {
	override method usar(paciente){
		paciente.fortaleza(paciente.edad() * 0.1)
	}
	
	override method puederSerUsadoPor(paciente) = paciente.dolor() < 20
	override method efectoDelUso(unPaciente) {}
}
