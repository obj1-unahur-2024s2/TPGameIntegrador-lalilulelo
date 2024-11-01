import elementos.*
import wollok.game.*

class Enemigo inherits ElementoAnimado {
  const img = "soldier_step"
  const property velocidadDeMovimiento
  var salud
  
  method recibirDanio(cantidadDanio) {
    salud = 0.max(salud - cantidadDanio)
  }
  
  method estaMuerto() = salud == 0
  
  method move(position) {
    posicion = position
  }
  
  method image() = (img + frame.toString()) + ".png"
  
  method seguirCamino(nivel) {
    nivel.camino().forEach(
      { c => game.onTick(500, "avanzar", { self.move(c) }) }
    )
  }
}