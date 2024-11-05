import wollok.game.*
import torretas.*

object jugador {
    var property position = game.origin()
    
    method colocarTorreta() {
        keyboard.num1().onPressDo{game.addVisual(Torret1)}
        keyboard.num2().onPressDo{game.addVisual(Torret2)}
        keyboard.num3().onPressDo{game.addVisual(Torret3)}
    }
}

