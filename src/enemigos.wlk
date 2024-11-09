import elementos.*
import wollok.game.*

class Enemigo inherits ElementoAnimado {
  const imagen = "soldier_step"
  const property velocidadDeMovimiento
  var salud
  
  method recibirDanio(cantidadDanio) {
    salud = 0.max(salud - cantidadDanio)
  }
  
  method estaMuerto() = salud == 0
  
  method move(position) {
    posicion = position
  }
  
  method image() = (imagen + frame.toString()) + ".png"
  
  method seguirCamino(nivel) {
    const camino = nivel.camino()
    game.onTick(
      velocidadDeMovimiento,
      "avanzar",
      { 
        if (!camino.isEmpty()) {
          self.move(camino.first())
          camino.remove(camino.first())
        } else {
          game.removeTickEvent("avanzar")
          game.removeTickEvent("animacion")
          self.atacarFortalezaDeNivel(nivel)
        }
        if (self.estaMuerto()) {
          game.removeTickEvent("avanzar")
          game.removeTickEvent("animacion")
          game.removeVisual(self)
        }
      }
    )
  }
  
  method atacarFortalezaDeNivel(nivel) {
    game.onTick(
      1000,
      "atacar",
      { 
        nivel.fortaleza().recibirDanio(10)
        if (self.estaMuerto()) {
          game.removeTickEvent("atacar")
          game.removeVisual(self)
        }
        if (nivel.fortaleza().estaDestruida()) {
          game.removeTickEvent("atacar")
          nivel.fortaleza().destruirse()
        }
      }
    )
  }
  
  method esEnemigo() = true
}