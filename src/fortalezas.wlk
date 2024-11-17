import elementos.*
import wollok.game.*

class Fortaleza inherits Elemento {
  var salud
  var imagen
  
  method recibirDanio(cantidadDeDanio) {
    salud = 0.max(salud - cantidadDeDanio)
  }
  
  method image() = imagen
  
  method cambiarImagen(nuevaImagen) {
    imagen = nuevaImagen
  }
  
  method destruirse() {
    game.removeVisual(self)
  }
  
  method estaDestruida() = salud == 0
  
  method esEnemigo() = false

  method esTrinchera() = false

  method esTorreta() = false
}