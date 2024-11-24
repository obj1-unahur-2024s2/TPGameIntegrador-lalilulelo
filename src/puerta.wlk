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
}