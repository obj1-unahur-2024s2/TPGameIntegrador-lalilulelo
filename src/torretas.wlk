import wollok.game.*
import elementos.*
import obstaculos.*

object gestorDeIds {
    var ultimoId = 0

    method nuevoId() {
        ultimoId = ultimoId + 1
        return ultimoId
    }
}


class Torreta inherits ElementoColisionable {
  var property idTorreta = gestorDeIds.nuevoId()
  const property nroTorreta
  const property rangoAtaque
  var copiaRangoAtaque = rangoAtaque
  const property direccion
  const property areaDeAtaque = [posicion]
  const property velocidadDeBala
  var img = ((("torret" + nroTorreta.toString()) + "_stance_") + direccion.toString()) + ".png"

  method image() = img

  method crearTorreta(torreta){
    game.addVisual(torreta)
    self.crearAreaDeDisparo()
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
    self.dispararProyectil()
  }

  method animacionAtaque() {
    img = "torret" + nroTorreta.toString() + "_frame1_" + direccion.toString() + ".png"
    game.removeTickEvent("animacionTorreta" + idTorreta)
  }

  method dispararProyectil(){
    const bala = new Proyectil(direccion = direccion, velocidad = self.velocidadDeBala(), posicion = self.posicion(), idBala = gestorDeIds.nuevoId())
    game.addVisual(bala)
    bala.initialize()
	}

  method esTorreta() = true
}

class HitBox inherits Elemento{
  const property cordenadasDeTorreta
  method image() = "hitBox.png"

  method detectarEnemigoContinuamente() {
    game.onCollideDo(self, {
      elemento => if(elemento.esJugador()) self.ordenarAtaque()
    })
  }

  method ordenarAtaque() {
    game.getObjectsIn(cordenadasDeTorreta).filter({e => e.esTorreta()}).first().atacar()
  }
}

class Proyectil inherits Elemento{
  const imagen = "bala.png"
  method image() = imagen

  var property idBala
  var property direccion
  const property velocidad

  method danio() = 20

  method initialize(){
    game.onTick(50, "animacionBala" + idBala.toString(),{self.moverBala()})
    }

  method moverBala() {
    if(game.getObjectsIn(self.siguientePosicion(self.direccion())).any({e => e.esColisionable()})){
      self.borrarse()
    }
     else{posicion = self.siguientePosicion(self.direccion())}
  }
  
  method siguientePosicion(enDireccion) {
    var ret = []
    if (enDireccion == 1){
      ret = game.at(posicion.x(), posicion.y()+1)
    }
    if (enDireccion == 2){
      ret = game.at(posicion.x()+1, posicion.y())
    }
    if (enDireccion == 3){
      ret = game.at(posicion.x(), posicion.y()-1)
    }
    if (enDireccion == 4){
      ret = game.at(posicion.x()-1, posicion.y())
    }
    return ret
  }  

  method borrarse() {
    if(game.hasVisual(self)){
	game.removeVisual(self)
	game.removeTickEvent("animacionBala" + idBala.toString())
		}
  }

  override method interactuarConJugador(jugador) {
    jugador.recibirDanio(self.danio())
    self.borrarse()
  }
}
