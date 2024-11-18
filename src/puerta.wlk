import elementos.*
import wollok.game.*
import jugador.*

class Teletransportador inherits Elemento{
    method image() = "portal.png"
  override method interactuarConJugador(jugador) {
    game.onCollideDo(self, {
      elemento => if(elemento.esJugador()) game.siguienteNivel()
    })
  }
}