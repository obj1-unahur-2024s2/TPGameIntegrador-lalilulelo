import wollok.game.*
import src.elementos.*
import src.niveles.*

object fondo inherits Elemento(posicion = game.at(0,0)){
  var imagen = "menuInicio.png"
 

  method menuInicio() {
    keyboard.enter().onPressDo({ if(game.hasVisual(self)) {game.removeVisual(self) nivel1.iniciar() game.boardGround("stage1.png")} })
  }

  method fondoMuerte() {
    imagen = "died.png"
    game.addVisual(self)
  }
    method image() = imagen 
}