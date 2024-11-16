import wollok.game.*
import elementos.*
import enemigos.*

class Torret inherits ElementoAnimado {
  const property nroTorreta
  const property velocidadAtaque
  const property rangoAtaque
  var copiaRangoAtaque = rangoAtaque
  const property danio
  const property direccion
  const property areaDeAtaque = [posicion]
  var img = ((("torret" + nroTorreta.toString()) + "_stance_") + direccion.toString()) + ".png"
  const property enemigosEnArea = []
  var copiaDeAreaDeAtaque = areaDeAtaque
  var siFunciono = false

  method siFunciono() = siFunciono

  method funciono() {
    siFunciono = true
  }

  method image() = img


  
   method crearAreaDeDisparo() {
    if (copiaRangoAtaque != 0 && direccion == 1) {
      self.crearAreaDeDisparoUp()
    } else if (copiaRangoAtaque != 0 && direccion == 2) {
      self.crearAreaDeDisparoRight()
    } else if (copiaRangoAtaque != 0 && direccion == 3) {
      self.crearAreaDeDisparoDown()
    } else if (copiaRangoAtaque != 0 && direccion == 4){
      self.crearAreaDeDisparoLeft()
    }
  }

  method crearAreaDeDisparoUp() {
    copiaRangoAtaque -= 1
    areaDeAtaque.add(game.at(areaDeAtaque.last().x(), areaDeAtaque.last().y() + 1))
    self.crearAreaDeDisparoUp()
  }

  method crearAreaDeDisparoRight() {
    copiaRangoAtaque -= 1
    areaDeAtaque.add(game.at(areaDeAtaque.last().x() + 1, areaDeAtaque.last().y()))
    self.crearAreaDeDisparo()
  }

  method crearAreaDeDisparoDown() {
    copiaRangoAtaque -= 1
    areaDeAtaque.add(game.at(areaDeAtaque.last().x(), areaDeAtaque.last().y() - 1))
    self.crearAreaDeDisparo()
  }

  method crearAreaDeDisparoLeft() {
    copiaRangoAtaque -= 1
    areaDeAtaque.add(game.at(areaDeAtaque.last().x() - 1, areaDeAtaque.last().y()))
    self.crearAreaDeDisparo()
  }
  
  method detectarEnemigoContinuamente() {
    game.onTick(velocidadAtaque, "atacar", {self.detectarEnemigo()})
  }
  
method detectarEnemigo() {
  if(copiaDeAreaDeAtaque.isEmpty() && !game.getObjectsIn(copiaDeAreaDeAtaque.first()).isEmpty() && game.getObjectsIn(copiaDeAreaDeAtaque.first()).first().esEnemigo()) {
        self.atacar()
    } else if(copiaDeAreaDeAtaque.isEmpty()){
        copiaDeAreaDeAtaque.remove(copiaDeAreaDeAtaque.first())
        self.reposo()
    } else copiaDeAreaDeAtaque = areaDeAtaque
}

  method atacar() {
    game.onTick(
      velocidadAtaque / 2,
      "animacion",
      { frame = if (frame < cantidadDeFotogramas) frame + 1 else 1 }
    )
    img =
      ((((("torret" + nroTorreta.toString()) + "_frame") + frame.toString()) + "_") + direccion.toString()) + ".png"
    return danio
  }
  
  method reposo() {
    game.removeTickEvent("animacion")
    img =
      ((("torret" + nroTorreta.toString()) + "_stance_") + direccion.toString()) + ".png"
  }
  
  method esEnemigo() = false
}

class Trinchera {
  var estaVacia = true
  const property direccion
  var property posicion
  const img = "road1.png"
  
  method image() = img
  
  method position() = posicion
  
  method ponerTorreta(torreta) {
    if (estaVacia) keyboard.num1().onPressDo({ game.addVisual(Torret) })
    keyboard.num2().onPressDo({ game.addVisual(Torret) })
    keyboard.num3().onPressDo({ game.addVisual(Torret) })
    estaVacia = true
  }

  method esEnemigo() = false
}