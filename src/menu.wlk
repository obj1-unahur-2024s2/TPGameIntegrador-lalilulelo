import wollok.game.*
import niveles.*

object menu {
    method mostrar() {
        game.boardGround("menuInicio.png")
        keyboard.enter().onPressDo({game.clear() game.boardGround("Stage1.png") nivel1.iniciar()})
    }
}