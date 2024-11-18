import wollok.game.*
import elementos.*
import obstaculos.*

object gestorIds{
	
	method nuevoId(){
		return 1.randomUpTo(10000).truncate(0)
		//Crea un nuevo ID randomizado, capas seria mejor si la id es un numero que siempre sube cada vez que se usa, para pensar...
	}
	
}

class Torreta inherits Obstaculos {
  var property idTorreta = gestorIds.nuevoId()
  const property nroTorreta
  const property rangoAtaque
  var copiaRangoAtaque = rangoAtaque
  const property danio
  var direccion
  const property areaDeAtaque = [posicion]
  var img = ((("torret" + nroTorreta.toString()) + "_stance_") + direccion.toString()) + ".png"

  method image() = img

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
    hitBox.detectarJugadorContinuamente()
    self.crearAreaDeDisparo()
  }

  method crearAreaDeDisparoRight() {
    copiaRangoAtaque -= 1
    areaDeAtaque.add(game.at(areaDeAtaque.last().x() + 1, areaDeAtaque.last().y()))
    const hitBox = new HitBox(posicion = areaDeAtaque.last(), cordenadasDeTorreta = posicion)
    game.addVisual(hitBox)
    hitBox.detectarJugadorContinuamente()
    self.crearAreaDeDisparo()
  }

  method crearAreaDeDisparoDown() {
    copiaRangoAtaque -= 1
    areaDeAtaque.add(game.at(areaDeAtaque.last().x(), areaDeAtaque.last().y() - 1))
    const hitBox = new HitBox(posicion = areaDeAtaque.last(), cordenadasDeTorreta = posicion)
    game.addVisual(hitBox)
    hitBox.detectarJugadorContinuamente()
    self.crearAreaDeDisparo()
  }

  method crearAreaDeDisparoLeft() {
    copiaRangoAtaque -= 1
    areaDeAtaque.add(game.at(areaDeAtaque.last().x() - 1, areaDeAtaque.last().y()))
    const hitBox = new HitBox(posicion = areaDeAtaque.last(), cordenadasDeTorreta = posicion)
    game.addVisual(hitBox)
    hitBox.detectarJugadorContinuamente()
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

  method dispararProyectil(){
		const bala = new Proyectil(direccion = direccion, danio = self.danio(), posicion = self.posicion())
		game.addVisual(bala)
		game.onCollideDo(bala,{jugador => jugador.interactuarConJugador(self)})
    //game.onCollideDo(bala,{jugador => jugador.recibirDanio(self.danio())})
	}
}



class HitBox inherits Elemento{
  const property cordenadasDeTorreta
  method image() = "hitBox.png"

  method position(nuevaPosicion) {
    posicion = nuevaPosicion
  }

  method detectarJugadorContinuamente() {
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
  var property idBala =  gestorIds.nuevoId()
  // daño , velocidad de la bala y direccion a al que se mueve y de donde sale creo y la id propia de la bala
  const property danio
  var property direccion
  // const property velocidad
  method moverDireccion(){
		// eliminar el proyectil cuando encuentre un objeto colisionable (creo)  
    if(game.getObjectsIn(posicion.left(1)).any({e => e.esColisionable()})){
			self.borrarse()
		}	
		else{posicion = self.siguientePosicion(self.direccion())}
		// sino se choco con nada hace que la posicion cambie dependiendo de la direccion de la bala
	}
  method borrarse() {
    if(game.hasVisual(self)){
			game.removeVisual(self)
      // todavia no me meti con las id porque me dan miedo
			game.removeTickEvent("movimientoBala" + idBala)
		}
  }

  // parecido a lo que hizo lauti con las hitbox 1 = arriba, 2 = derecha, 3 = abajo y 4 = izquierda
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
}
