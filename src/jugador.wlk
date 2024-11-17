import wollok.game.*
import torretas.*

object jugador {
    var property position = game.origin()
    var torretasPuestas = 0

    method ponerTorreta(torreta) {
    if (estaVacia) keyboard.num1().onPressDo({ game.addVisual(Torret) })
    keyboard.num2().onPressDo({ game.addVisual(Torret) })
    keyboard.num3().onPressDo({ game.addVisual(Torret) })
    estaVacia = false
  }
}

