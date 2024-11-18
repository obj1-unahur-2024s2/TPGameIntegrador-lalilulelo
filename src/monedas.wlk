import src.elementos.*
import wollok.game.*
class Moneda inherits Elemento{
    const imagen = "coing.png"
    const property valor
    method image() = imagen

   override method interactuarConJugador(jugador) {
        jugador.sumarPuntos(valor)
        game.removeVisual(self)
    }

}