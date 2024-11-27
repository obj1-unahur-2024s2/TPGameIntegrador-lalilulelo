// src/puerta.wlk
// src/puerta.wlk
// src/puerta.wlk
// src/puerta.wlk
// src/puerta.wlk
// src/puerta.wlk
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
        jugador.nivelActual().ost().stop()
        game.clear()
        nivel2.iniciar()
    }
}

object puertaNivel2 inherits Teletransportador(posicion = game.at(0,0)){
  override method interactuarConJugador(jugador) {
        jugador.nivelActual().ost().stop()
        game.clear()
        nivel3.iniciar()
    }
}

object puertaNivel3 inherits Teletransportador(posicion = game.at(0,0)){
    const winAud = game.sound("youWin.mp3")
    override method interactuarConJugador(jugador) {
        jugador.nivelActual().ost().stop()
        game.clear()
        const victory = new Fondo(img = "youWin.png")
        game.addVisual(victory)
        winAud.volume(0.10)
        winAud.play()
    }
}