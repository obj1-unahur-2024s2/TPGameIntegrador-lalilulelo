import niveles.*
import elementos.*
import wollok.game.*

class Enemigo inherits Elemento {
  const property idEnemigo
  const imagen = "soldier_step"
  const property velocidadDeMovimiento
  var property frame = 1
  const property fotogramas = 2
  var salud
  
  method recibirDanio(cantidadDanio) {
    salud = 0.max(salud - cantidadDanio)
  }

  method salud() = salud
  
  method estaMuerto() = salud == 0
  
  method move(position) {
    posicion = position
  }
  
  method animar() {
    game.onTick(
      500,
      "animacion" + idEnemigo.toString(),
      {
        frame = if(frame == fotogramas) 1 else frame + 1
      }
    )
  }

  method image() = (imagen + frame.toString()) + ".png"
  
  method seguirCamino(nivel) {
    const camino = nivel.camino()
    game.onTick(
      velocidadDeMovimiento,
      "avanzar" + idEnemigo.toString(),
      { 
        if (!camino.isEmpty()) {
          self.move(camino.first())
          camino.remove(camino.first())
        } else {
          game.removeTickEvent("avanzar" + idEnemigo.toString())
          game.removeTickEvent("animacion" +  idEnemigo.toString())
          self.entrarEnFortalezaDeNivel(Nivel)
        }
        if (self.estaMuerto()) {
          game.removeTickEvent("avanzar" + idEnemigo.toString())
          game.removeTickEvent("animacion" + idEnemigo.toString())
          game.removeVisual(self)
        }
      }
    )
  }
  
  method entrarEnFortalezaDeNivel(nivel) {
        if (nivel.fortalezas().first().estaDestruida()) {
          nivel.fortalezas().first().destruirse()
        }
    nivel.fortalezas().first().sumarEnemigo()
    game.removeVisual(self)
  }
  
  method esEnemigo() = true

  method esTrinchera() = false

  method esTorreta() = false
}