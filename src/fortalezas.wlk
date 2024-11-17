import elementos.*
import wollok.game.*

class Fortaleza inherits Elemento {
  var imagen = "fortaleza.png"
  var cantidadEnemigos = 0
  const cantidadEnemigosASoportar
  

  
  method image() = imagen
  
  method cambiarImagen(nuevaImagen) {
    imagen = nuevaImagen
  }
  
  method destruirse() {
    game.removeVisual(self)
  }
  
  method sumarEnemigo() {
    cantidadEnemigos += 1
  }

  method estaDestruida() {
  return cantidadEnemigos == cantidadEnemigosASoportar
  } 
  
  method esEnemigo() = false

  method esTrinchera() = false

  method esTorreta() = false
}