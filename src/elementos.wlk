class Elemento {
  var property posicion
  var imagen
  
  method position() = posicion
  
  method image() = imagen
  
  method cambiarImagen(imagenNueva) {
    imagen = imagenNueva
  }
}

class ElementoConSalud inherits Elemento {
  var property salud
  
  method recibirDanio(cantidadDanio)
}