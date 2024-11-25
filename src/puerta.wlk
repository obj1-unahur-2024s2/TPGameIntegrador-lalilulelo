import elementos.*
import wollok.game.*
import src.jugador.*
import src.niveles.*
import src.fondo.*

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

object puertaNivel1 inherits Teletransportador(posicion = game.at(1,0)){
  override method interactuarConJugador(jugador) {
        nivel1.ost().stop()
        game.clear()
        nivel2.iniciar()
    }
}

object puertaNivel2 inherits Teletransportador(posicion = game.at(0,0)){
  override method interactuarConJugador(jugador) {
        nivel1.ost().stop()
        game.clear()
        const muerte = new Fondo(img = "youWin.png")
        game.addVisual(muerte)
    }
}
