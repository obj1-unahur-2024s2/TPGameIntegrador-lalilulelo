class Elemento {
  var property posicion
  const imagen
  
  method position() = posicion
  
  method image() = imagen
}

class ElementoConSalud inherits Elemento {
  var property salud
  
  method recibirDanio()
}