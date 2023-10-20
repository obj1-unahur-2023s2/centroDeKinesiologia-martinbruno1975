class Paciente {
	const property edad
	var fortaleza 
	var dolor
	const rutina = []
	
	method dolor() = dolor
	method dolor(cantidad) {
		dolor = 0.max(dolor - cantidad)
	}
	method fortaleza() = fortaleza
	method fortaleza(cantidad) {
		fortaleza += cantidad
	}
	
	method agregarAparatos(listaAparatos){
		rutina.addAll(listaAparatos)
	}
	
	method usarAparato(aparato){
		if (!self.puedeUsar(aparato)) {
			self.error("El paciente no puede usar el aparato")
		}
		aparato.efectoDelUso(self)
		aparato.usar(self)
	}
	
	method puedeUsar(aparato) {
		return aparato.puederSerUsadoPor(self)
	}
	
	method realizarRutina(){
		if (!self.puedeHacerLaRutina()){
			self.error("El paciente no puede hacer la rutina")
		}
		rutina.forEach({a => self.usarAparato(a)})
	} 
	
	method puedeHacerLaRutina(){
		return rutina.all({a => self.puedeUsar(a)})
	}	
}

class Resistente inherits Paciente {
	override method realizarRutina(){
		super()
		//fortaleza += rutina.size()
		self.fortaleza(rutina.size())
	}
}

class Caprichoso inherits Paciente {
	override method puedeHacerLaRutina() = super() && self.hayAlgunAparatoRojo() 
	
	override method realizarRutina(){
		(1..2).forEach({e => super()})
		/*super()
		super()*/	
	}
	
	method hayAlgunAparatoRojo() {
		return rutina.any({a=>a.color() == "rojo"})
	}
}

class RapidaRecuperacion inherits Paciente {
	override method realizarRutina() {
		super()
		//dolor = 0.max(dolor - coeficienteDeRecuperacion.valor())
		self.dolor(coeficienteDeRecuperacion.valor())
	}
}

object coeficienteDeRecuperacion {
	var property valor = 3
}

