import elementos.*
import wollok.game.*
import jugador.*
import src.niveles.*

class Teletransportador inherits Elemento{
    const img = "portal.png"

    method image() = img

    override method interactuarConJugador(jugador) {
        jugador.position(game.origin().up(1))
    }

    method aparecer() {
        game.addVisual(self)
    }

}

object puertaNivel1 inherits Teletransportador(posicion = game.at(5,2)){
  override method interactuarConJugador(jugador) {
        super(jugador)
        nivel1.pasarASiguienteNivel()
    }


}

object puertaNivel2 inherits Teletransportador(posicion = game.at(5,2)){
  override method interactuarConJugador(jugador) {
  
    }

}