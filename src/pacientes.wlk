class Paciente {
	var property edad
	var fortaleza 
	var dolor
	const aparatos = []
	
	method dolor() = dolor
	method dolor(cantidad) {
		dolor = 0.max(dolor - cantidad)
	}
	method fortaleza() = fortaleza
	method fortaleza(cantidad) {
		fortaleza += cantidad
	}
	
	method agregarAparato(aparato){
		aparatos.add(aparato)
	}
	
	method usarAparato(aparato){
		aparato.usar(self)
	}
	
	method puedeUsar(aparato) {
		return aparato.puederSerUsadoPor(self)
	}
	
	method realizarRutina(){
		aparatos.forEach({a => a.usar(self)})
	} 
	
	method puedeHacerLaRutina(){
		return aparatos.all({a => a.puederSerUsadoPor(self)})
	}	
}

class Resistente inherits Paciente {
	override method realizarRutina(){
		super()
		fortaleza += aparatos.size() 
	}
}

class Caprichoso inherits Paciente {
	if (){
		super()	
	}
	
}

class RapidaRecuperacion inherits Paciente {
	
}