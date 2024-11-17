import wollok.game.*
import elementos.*
import enemigos.*

class Torret inherits Elemento {
  const property nroTorreta
  const property velocidadAtaque
  const property rangoAtaque
  var copiaRangoAtaque = rangoAtaque
  const property danio
  var direccion
  const property areaDeAtaque = [posicion]
  var img = ((("torret" + nroTorreta.toString()) + "_stance_") + direccion.toString()) + ".png"
  const property enemigosEnArea = []
  const property copiaDeAreaDeAtaque = [posicion]

  method image() = img

  method definirDireccion() {
    direccion = game.getObjectsIn(posicion).filter({e => e.esTrinchera()}).direccion()
  }

  method copiaDeAreaDeAtaque() = copiaDeAreaDeAtaque

   method crearAreaDeDisparo() {
    if (copiaRangoAtaque != 0 && direccion == 1) {
      self.crearAreaDeDisparoUp()
    } if (copiaRangoAtaque != 0 && direccion == 2) {
      self.crearAreaDeDisparoRight()
    } if (copiaRangoAtaque != 0 && direccion == 3) {
      self.crearAreaDeDisparoDown()
    }  if (copiaRangoAtaque != 0 && direccion == 4){
      self.crearAreaDeDisparoLeft()
    }
  }

  method crearAreaDeDisparoUp() {
    copiaRangoAtaque -= 1
    areaDeAtaque.add(game.at(areaDeAtaque.last().x(), areaDeAtaque.last().y() + 1))
    copiaDeAreaDeAtaque.add(areaDeAtaque.last())
    self.crearAreaDeDisparo()
  }

  method crearAreaDeDisparoRight() {
    copiaRangoAtaque -= 1
    areaDeAtaque.add(game.at(areaDeAtaque.last().x() + 1, areaDeAtaque.last().y()))
    copiaDeAreaDeAtaque.add(areaDeAtaque.last())
    self.crearAreaDeDisparo()
  }

  method crearAreaDeDisparoDown() {
    copiaRangoAtaque -= 1
    areaDeAtaque.add(game.at(areaDeAtaque.last().x(), areaDeAtaque.last().y() - 1))
    copiaDeAreaDeAtaque.add(areaDeAtaque.last())
    self.crearAreaDeDisparo()
  }

  method crearAreaDeDisparoLeft() {
    copiaRangoAtaque -= 1
    areaDeAtaque.add(game.at(areaDeAtaque.last().x() - 1, areaDeAtaque.last().y()))
    copiaDeAreaDeAtaque.add(areaDeAtaque.last())
    self.crearAreaDeDisparo()
  }
  
  method detectarEnemigoContinuamente() {
    game.onTick(velocidadAtaque, "atacar", {self.detectarEnemigo()})
  }

method detectarEnemigo() {
  if(!self.copiaDeAreaDeAtaque().isEmpty() && !game.getObjectsIn(self.copiaDeAreaDeAtaque().first()).isEmpty() && game.getObjectsIn(self.copiaDeAreaDeAtaque().first()).first().esEnemigo()) {
        self.atacar()
    } else if(!self.copiaDeAreaDeAtaque().isEmpty()){
        self.copiaDeAreaDeAtaque().remove(self.copiaDeAreaDeAtaque().first())
        self.reposo()
        self.detectarEnemigo()
    } else self.copiaDeAreaDeAtaque().addAll(areaDeAtaque)
}

  method atacar() {
    img = "torret" + nroTorreta.toString() + "_frame2_" + direccion.toString() + ".png"
    game.onTick(500, "animacionTorreta", {self.animacionAtaque()})
  }

  method animacionAtaque() {
    img = "torret" + nroTorreta.toString() + "_frame1_" + direccion.toString() + ".png"
    game.removeTickEvent("animacionTorreta")
  }
  
  method reposo() {
    game.removeTickEvent("animacion")
    img = "torret" + nroTorreta.toString() + "_stance_" + direccion.toString() + ".png"
  }
  
  method esEnemigo() = false

  method esTrinchera() = false
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
    estaVacia = false
  }

  method esEnemigo() = false

  method esTrinchera() = true
}