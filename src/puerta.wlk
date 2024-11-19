import elementos.*
import wollok.game.*
import jugador.*
import src.niveles.*

class Teletransportador inherits Elemento{
    const img = "portal.png"

    method image() = img

    override method interactuarConJugador(jugador) {
        jugador.position(game.origin().up(1))
        nivel1.pasarASiguienteNivel()
    }

}