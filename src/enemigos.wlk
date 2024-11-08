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
    game.onTick(2000, "avanzar", {
      if(!camino.isEmpty()) {
        self.move(camino.first())
        camino.remove(camino.first())
      }
    })
  }

  /*
    method move(positionX, positionY) {
    posicion = game.at(positionX, positionY)
  }
  
  method image() = (img + frame.toString()) + ".png"
  
  method seguirCamino(nivel) {
    game.onTick(1000, "avanzar", { self.avanzar(nivel) })
  }

  method avanzar(nivel) {
    const camino = nivel.camino()
    
  }

  method U() {
    self.move(posicion.x(), posicion.y()+1)
  }

  method R() {
    self.move(posicion.x()+1, posicion.y())
  }

  method D() {
    self.move(posicion.x(), posicion.y()-1)
  }

  method L() {
    self.move(posicion.x()-1, posicion.y())
  }
  */
  method esEnemigo() = true
}