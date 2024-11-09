import elementos.*
import wollok.game.*

class Enemigo inherits ElementoAnimado {
  const img = "soldier_step"
  const property velocidadDeMovimiento
  const property caminoASeguir = []
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
    const camino = nivel.camino()
    game.onTick(
      velocidadDeMovimiento,
      "avanzar",
      { if (!camino.isEmpty()) {
          self.move(camino.first())
          camino.remove(camino.first())
        } }
    )
    if (camino.isEmpty()) game.removeTickEvent("avanzar")
  }
  
  method esEnemigo() = true
}