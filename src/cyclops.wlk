import niveles.*
import elementos.*
import jugador.*
import obstaculos.*
import wollok.game.*

class Ciclope inherits Elemento {
  const property velocidadMovimiento
  const danio = 100
  const cyclopsAwake = "cyclops.mp3"
  var img = "cyclopszzz.png"
  
  method jugadorX() = jugador.position().x()
  method jugadorY() = jugador.position().y()

  method image() = img

  method danio() = danio

  method recibirDanio(danioRecibido) {}

  method seguirJugadorConstantemente(posicionJugador) {
    var movimientoVariable = velocidadMovimiento
    if(!game.getObjectsIn(posicion).any({e => e.esColisionable()})) movimientoVariable /= 2
    game.onTick(velocidadMovimiento, "persecucion", {self.seguirJugador(posicionJugador)})
  }
  
  method seguirJugador(posicionJugador) {
		if(self.jugadorY() > posicion.y()){self.posicion(posicion.up(1))}
    if(self.jugadorX() > posicion.x()){self.posicion(posicion.right(1))}
    if(self.jugadorY() < posicion.y()){self.posicion(posicion.down(1))}
    if(self.jugadorX() < posicion.x()){self.posicion(posicion.left(1))}
  }

  method despertar() {
    self.seguirJugadorConstantemente(jugador.position())
    game.sound(cyclopsAwake).play()
    img = "cyclops.png"
  }

  override method interactuarConJugador(jugador) {
    jugador.recibirDanio(self.danio())
  }
}