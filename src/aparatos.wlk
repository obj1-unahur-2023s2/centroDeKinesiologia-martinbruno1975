import pacientes.*

class Aparato {
	var property color = "blanco"
	
	method usar(paciente)
}

class Magneto inherits Aparato {
	override method usar(paciente) {
		paciente.dolor(paciente.dolor() * 0.1)
	}
	
	method puederSerUsadoPor(paciente) = true
}

class Bicicleta inherits Aparato {
	override method usar(paciente){
		paciente.dolor(4)
		paciente.fortaleza(3)
	}
	
	method puederSerUsadoPor(paciente) = paciente.edad() >= 8
}

class Minitramp inherits Aparato {
	override method usar(paciente){
		paciente.fortaleza(paciente.edad() * 0.1)
	}
	
	method puederSerUsadoPor(paciente) = paciente.dolor() < 20
}
