import elementos.*
import wollok.game.*
import src.jugador.*
import src.niveles.*

class Teletransportador {
    const posicion
    const img = "portal.png"

    method position() = posicion

    method image() = img

    method aparecer() {
        game.addVisual(self)
    }

    method interactuarConJugador(jugador) {
        
    }

    method esColisionable() = false

    method esJugador() = false

    method desaparecer() {
        game.removeVisual(self)
    }
}

object puertaNivel1 inherits Teletransportador(posicion = game.at(1,5)){
  override method interactuarConJugador(jugador) {
        nivel1.ost().stop()
        game.clear()
        nivel2.iniciar()
    }
}
