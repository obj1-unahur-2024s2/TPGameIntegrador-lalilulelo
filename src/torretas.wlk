import wollok.game.*
import elementos.*
import enemigos.*

class Torret inherits ElementoAnimado {
  const property nroTorreta
  const property velocidadAtaque
  var property rangoAtaque
  const property danio
  const property direccion
  const property areaDeAtaque = [posicion]
  var img = ((("torret" + nroTorreta.toString()) + "_stance_") + direccion.toString()) + ".png"
  const property copiaDeAreaDeAtaque = areaDeAtaque
  const property enemigosEnArea = []
  var siFunciono = false

  method siFunciono() = siFunciono

  method funciono() {
    siFunciono = true
  }

  method image() = img

  method crearAreaDeDisparo() {
    const copiaDeSeguridad = rangoAtaque
    game.onTick(100, "repetir", {self.areaDeDisparo()})
    rangoAtaque = copiaDeSeguridad
  }

  method areaDeDisparo() {
    if (rangoAtaque != 0 && direccion == 1) {
      rangoAtaque -= 1
      areaDeAtaque.add(game.at(areaDeAtaque.last().x(), areaDeAtaque.last().y() + 1))
    } else if (rangoAtaque != 0 && direccion == 2) {
      rangoAtaque -= 1
      areaDeAtaque.add(game.at(areaDeAtaque.last().x() + 1, areaDeAtaque.last().y()))
    }
    else if (rangoAtaque != 0 && direccion == 3) {
      rangoAtaque -= 1
      areaDeAtaque.add(game.at(areaDeAtaque.last().x(), areaDeAtaque.last().y() - 1))
    } else if (rangoAtaque != 0 && direccion == 4){
      rangoAtaque -= 1
      areaDeAtaque.add(game.at(areaDeAtaque.last().x() - 1, areaDeAtaque.last().y()))
    } else {
      game.removeTickEvent("repetir")
    }
  }
  
  method detectarEnemigoContinuamente() {
    game.onTick(100, "deteccion", { self.detectarEnemigo() })
  }
  
  method detectarEnemigo() {
    
    /*game.onTick(1, "ordenDeAtaque", {*/
      if(!self.copiaDeAreaDeAtaque().isEmpty() && !game.getObjectsIn(self.copiaDeAreaDeAtaque().first()).isEmpty() && game.getObjectsIn(self.copiaDeAreaDeAtaque().first()).first().esEnemigo()) {
        self.atacar()
    } else if(!self.copiaDeAreaDeAtaque().isEmpty()){
        self.copiaDeAreaDeAtaque().remove(self.copiaDeAreaDeAtaque().first())
    } else self.funciono()
    /*})*/

    if (!enemigosEnArea.isEmpty()) self.atacar()
    else self.reposo()
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
    img = ((("torret" + nroTorreta.toString()) + "_stance_") + direccion.toString()) + ".png"
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
    if(estaVacia)
      keyboard.num1().onPressDo{game.addVisual(Torret)}
      keyboard.num2().onPressDo{game.addVisual(Torret)}
      keyboard.num3().onPressDo{game.addVisual(Torret)}
      estaVacia = true
  }

  method esEnemigo() = false
}