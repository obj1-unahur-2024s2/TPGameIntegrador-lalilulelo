import elementos.*
import wollok.game.*
import jugador.*
import src.niveles.*

class Teletransportador inherits Elemento{
    const img = "portal.png"

    method image() = img

    override method interactuarConJugador(jugador) {
        game.clear()
        nivel2.iniciar()
        jugador.posicion(game.at(0,0))
    }
}