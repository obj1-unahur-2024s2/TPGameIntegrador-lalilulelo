import wollok.game.*
import elementos.*
import enemigos.*

class Torret inherits ElementoAnimado {
  const property nroTorreta
  const property velocidadAtaque
  const property rangoAtaque
  const property danio
  var img = "torret1_stance_down.png"

  method image() = img
  
  method detectarEnemigoContinuamente() {
    game.onTick(100, "deteccion", { self.detectarEnemigo() })
  }
  
  method detectarEnemigo() {
    if (game.getObjectsIn(
        posicion .. game.at(Trinchera.direccion.rangoX(), Trinchera.direccion.rangoY())
      ).esEnemigo()) self.atacar()
    else self.reposo()
  }

  method direccionADisparar() {

  }
  
  method atacar() {
    game.onTick(
      velocidadAtaque / 2,
      "animacion",
      { frame = if (frame < cantidadDeFotogramas) frame + 1 else 1 }
    )
    img =
      ((((("torret" + nroTorreta.toString()) + "_frame") + frame.toString()) + "_") + Trinchera.direccion.toString()) + ".png"
    return danio
  }
  
  method reposo() {
    game.removeTickEvent("animacion")
    img = ((("torret" + nroTorreta.toString()) + "_stance_") + Trinchera.direccion.toString()) + ".png"
  }
}

class Trinchera {
  var estaVacia = true
  const property direccion
  var property posicion
  
  method position() = posicion

  method ponerTorreta(torreta) {
      keyboard.num1().onPressDo{game.addVisual(Torret)}
      keyboard.num2().onPressDo{game.addVisual(Torret)}
      keyboard.num3().onPressDo{game.addVisual(Torret)}
      estaVacia = true
  }
}

object up {
  method rangoY() = Torret.posicion().y() + Torret.rangoAtaque
  method rangoX() = Torret.posicion().x()
}

object right {
  method rangoX() = Torret.posicion().x() + Torret.rangoAtaque
  method rangoY() = Torret.posicion().y()
}

object down {
  method rangoY() = Torret.posicion().y() - Torret.rangoAtaque
  method rangoX() = Torret.posicion().x()
}

object left {
  method rangoX() = Torret.posicion().x() - Torret.rangoAtaque
  method rangoY() = Torret.posicion().y()
}