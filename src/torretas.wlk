import wollok.game.*
import elementos.*
import obstaculos.*

class Torret inherits ElementoColisionable {
  const property idTorreta
  const property nroTorreta
  const property rangoAtaque
  var copiaRangoAtaque = rangoAtaque
  const property danio
  var direccion
  const property areaDeAtaque = [posicion]
  var img = ((("torret" + nroTorreta.toString()) + "_stance_") + direccion.toString()) + ".png"

  method definirDireccion() {
    direccion = game.getObjectsIn(posicion).filter({e => e.esTrinchera()}).direccion()
  }

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
    const hitBox = new HitBox(posicion = areaDeAtaque.last(), cordenadasDeTorreta = posicion)
    game.addVisual(hitBox)
    hitBox.detectarEnemigoContinuamente()
    self.crearAreaDeDisparo()
  }

  method crearAreaDeDisparoRight() {
    copiaRangoAtaque -= 1
    areaDeAtaque.add(game.at(areaDeAtaque.last().x() + 1, areaDeAtaque.last().y()))
    const hitBox = new HitBox(posicion = areaDeAtaque.last(), cordenadasDeTorreta = posicion)
    game.addVisual(hitBox)
    hitBox.detectarEnemigoContinuamente()
    self.crearAreaDeDisparo()
  }

  method crearAreaDeDisparoDown() {
    copiaRangoAtaque -= 1
    areaDeAtaque.add(game.at(areaDeAtaque.last().x(), areaDeAtaque.last().y() - 1))
    const hitBox = new HitBox(posicion = areaDeAtaque.last(), cordenadasDeTorreta = posicion)
    game.addVisual(hitBox)
    hitBox.detectarEnemigoContinuamente()
    self.crearAreaDeDisparo()
  }

  method crearAreaDeDisparoLeft() {
    copiaRangoAtaque -= 1
    areaDeAtaque.add(game.at(areaDeAtaque.last().x() - 1, areaDeAtaque.last().y()))
    const hitBox = new HitBox(posicion = areaDeAtaque.last(), cordenadasDeTorreta = posicion)
    game.addVisual(hitBox)
    hitBox.detectarEnemigoContinuamente()
    self.crearAreaDeDisparo()
  }

  method atacar() {
    img = "torret" + nroTorreta.toString() + "_frame2_" + direccion.toString() + ".png"
    game.onTick(500, "animacionTorreta" + idTorreta, {self.animacionAtaque()})
  }

  method animacionAtaque() {
    img = "torret" + nroTorreta.toString() + "_frame1_" + direccion.toString() + ".png"
    game.removeTickEvent("animacionTorreta" + idTorreta)
  }
}

class HitBox inherits Elemento{
  const property cordenadasDeTorreta
  method image() = "hitBox.png"

  method position(nuevaPosicion) {
    posicion = nuevaPosicion
  }

  method detectarEnemigoContinuamente() {
    game.onCollideDo(self, {
      elemento => if(elemento.esEnemigo()) self.ordenarAtaque()
    })
  }

  method ordenarAtaque() {
    return game.getObjectsIn(cordenadasDeTorreta).filter({e => e.esTorreta()}).first().atacar()
  }
}