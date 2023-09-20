import rodados.*

class Dependencia {
	var property cantidadEmpleado = 0
	const pedidos = []
	const rodados = []
	
	method agregarAFlota(rodado){
		rodados.add(rodado)
	}
	method quitarDeFlota(rodado){
		rodados.remove(rodado)
	}
	method pesoTotalFlota(){
		return rodados.sum({rodado => rodado.peso()})
	}
	method todosSuperanXVelocidad(velocidad){
		return rodados.all({r => r.velocidad() >= velocidad})
	}
	method estaBienEquipada(){
		return rodados.size() >= 3 and self.todosSuperanXVelocidad(100)
	}
	method capacidadTotalEnColor(color){
		return (self.rodadosDeUnColor(color)).sum({r=>r.capacidad()})
	}
	
	method rodadosDeUnColor(unColor) {
		return rodados.filter({r=>r.color()==unColor})
	}
	
	method colorDelRodadoMasRapido(){
		return rodados.max({r => r.velocidad()}).color()
	}
	
	method rodadoMasRapido() {
		if (rodados.isEmpty())
			self.error("No se puede calcular el maximo")
		return rodados.max({r=>r.velocidad()})
	}
	
	method capacidadDeLaFlota(){
		return rodados.sum({r=>r.capacidad()})
	}
	
	method capacidadFaltante(){
		return 0.max(cantidadEmpleado - self.capacidadDeLaFlota())
	}
	
	method esGrande(){
		return (cantidadEmpleado >= 40 and rodados.size() >= 5)
	}
	
	method ningunoSatisface(pedido){
		return not rodados.any({r => pedido.puedeSerSatisfechoPor(r)})
	}
	
	method pedidosInsatisfechos(){
		return pedidos.filter({p => self.ningunoSatisface(p)})
	}
}
	}
}
