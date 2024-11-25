import src.elementos.*
import wollok.game.*
class Moneda inherits Elemento{
    const imagen = "coin.png"
    const property valor = 10
    const coinAud = game.sound("coin.mp3")

    method image() = imagen

   override method interactuarConJugador(jugador) {
        jugador.sumarPuntos(valor)
        game.removeVisual(self)
        coinAud.play()
        coinAud.volume(0.5)
    }
}