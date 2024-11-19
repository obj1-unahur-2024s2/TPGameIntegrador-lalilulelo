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


class Torreta inherits Obstaculo {
  const property esTorreta = true 
  var property idTorreta = gestorDeIds.nuevoId()
  const property nroTorreta
  const property rangoAtaque
  var copiaRangoAtaque = rangoAtaque
  const property danio
  var direccion
  const property areaDeAtaque = [posicion]
  var img = ((("torret" + nroTorreta.toString()) + "_stance_") + direccion.toString()) + ".png"

  override method image() = img

  method definirDireccion() {
    direccion = game.getObjectsIn(posicion).filter({e => e.esTrinchera()}).direccion()
  }

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
    const bala = new Proyectil(direccion = direccion, danio = self.danio(), posicion = self.posicion(), idBala = gestorDeIds.nuevoId())
    game.addVisual(bala)
    bala.moverBala()
    //game.onCollideDo(bala,{jugador => jugador.recibirDanio(self.danio())})
	}
}

class HitBox inherits Elemento{
  const property cordenadasDeTorreta
  // usar "hitBoz.png" cuando ya no haga falta probar las HitBoxes de las torretas.
  method image() = "road1.png"

  method position(nuevaPosicion) {
    posicion = nuevaPosicion
  }

  method detectarEnemigoContinuamente() {
    game.onCollideDo(self, {
      elemento => if(elemento.esJugador()) self.ordenarAtaque()
    })
  }

  method ordenarAtaque() {
    // esto lo hizo lautaro y no se si deberia ser un return ayuda
    return game.getObjectsIn(cordenadasDeTorreta).filter({e => e.esTorreta()}).first().atacar()
  }

  method esEnemigo() = false

  method esTrinchera() = false

  method esTorreta() = false
}

class Proyectil inherits Elemento{
  const imagen = "coin.png"
  method image() = imagen

  var property idBala
  // daño , velocidad de la bala y direccion a al que se mueve y de donde sale creo y la id propia de la bala
  const property danio
  var property direccion
  // const property velocidad

  method initialize(){
    //"movimientoBala"+ idBala.toString()
    game.onTick(50,"coin,png",{self.moverBala()})
    }

  method moverBala() {
    if(game.getObjectsIn(self.siguientePosicion(self.direccion())).any({e => e.esColisionable()})){
      self.borrarse()
    }
     else{posicion = self.siguientePosicion(self.direccion())}
    // sino se choco con nada hace que la posicion cambie dependiendo de la direccion de la bala
  }

  // parecido a lo que hizo lauti con las hitbox 1 = arriba, 2 = derecha, 3 = abajo y 4 = izquierda

  // alternativamente podriamos hacer los objetos arriba derecha abajo e izquierda, y que devuelvan esto, pero me da pereza, sigo creyendo que los COLORES DE UN AUTO NO DEBERIAN SER OBJETOS(estas re ardido porque desaprobaste)
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
      // todavia no me meti con las id porque me dan miedo. eso es mentira ya lo agragaste 
	game.removeTickEvent("movimientoBala" + idBala)
		}
  }

  override method interactuarConJugador(jugador) {
    jugador.recibirDanio(self.danio())
    self.borrarse()
  }

  method esEnemigo() = false

  method esTrinchera() = false

  method esTorreta() = false

}
