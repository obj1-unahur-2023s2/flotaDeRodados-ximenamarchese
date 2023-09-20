import rodados.*

class Pedido{
	const property distancia
	const property tiempo
	const property pasajeros
	const coloresIncompatibles = #{}
	
	method velocidadRequerida(){
		return distancia/tiempo
	}
	
	method puedeSerSatisfechoPor(unRodado){
		return unRodado.velocidad() >= 10 + self.velocidadRequerida() 
		and unRodado.capacidad() >= pasajeros
		and self.esDeColorCompatible(unRodado.color())
	}
	
	method esDeColorCompatible(unColor){
		return coloresIncompatibles.contains(unColor)
	}
}
