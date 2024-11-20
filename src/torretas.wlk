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
  const property velocidadDeBala
  const direccion
  const property areaDeAtaque = [posicion]
  var img = ((("torret" + nroTorreta.toString()) + "_stance_") + direccion.toString()) + ".png"
  var enCooldown = false
  const tiempoCooldown = 1000 // Tiempo de cooldown en milisegundos.

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
      if (!enCooldown) { // Solo dispara si no está en cooldown.
            img = "torret" + nroTorreta.toString() + "_frame2_" + direccion.toString() + ".png"
            game.onTick(500, "animacionTorreta" + idTorreta, { self.animacionAtaque() })
            self.dispararProyectil()
            self.activarCooldown()
        }
    }

  method animacionAtaque() {
    img = "torret" + nroTorreta.toString() + "_frame1_" + direccion.toString() + ".png"
    game.removeTickEvent("animacionTorreta" + idTorreta)
  }

  method activarCooldown() {
        enCooldown = true
        game.onTick(tiempoCooldown, "cooldownTorreta" + idTorreta, { self.finalizarCooldown() })
    }

  method finalizarCooldown() {
        enCooldown = false
        game.removeTickEvent("cooldownTorreta" + idTorreta) // Limpieza del evento.
    }
    
  method dispararProyectil() {
      const bala = new Proyectil(
        direccion = direccion, 
        posicion = self.posicion(),
        danio = 20, 
        idBala = gestorDeIds.nuevoId(),
        velocidad = self.velocidadDeBala(),
        movimientosPosibles = self.rangoAtaque()
        )

        const shootAud = "shoot.mp3"
      
    game.addVisual(bala)
    game.sound(shootAud).play()
    controladorDeProyectiles.agregarProyectil(bala)
    bala.moverBala() // Inicia el movimiento.
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
  const property danio
  var property direccion
  const property velocidad 
  var movimientosPosibles 
  

  method initialize(){
    //"movimientoBala"+ idBala.toString()
		game.onTick(velocidad,"coin,png",{self.moverBala()})
	}

  

  method moverBala() {
    if (movimientosPosibles <= 0 || game.getObjectsIn(self.siguientePosicion(self.direccion())).any({e => e.esColisionable()})) {
        self.borrarse()
    } else {
        posicion = self.siguientePosicion(self.direccion())
        movimientosPosibles -= 1 // solo puede disparar denuevo si la bala ya recorrio la mitad del camino
    }
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
    game.removeVisual(self)
    game.removeTickEvent("movimientoBala" + idBala)
    controladorDeProyectiles.eliminarProyectil(self)
}


  override method interactuarConJugador(jugador) {
        jugador.recibirDanio(self.danio())
        self.borrarse()
  }
}

object controladorDeProyectiles {
    const proyectiles = []

    method moverProyectiles() {
        proyectiles.forEach({proyectil =>
            proyectil.moverBala()
        })
    }

    method agregarProyectil(proyectil) {
        proyectiles.add(proyectil)
        if (proyectiles.size() == 1) { 
            game.onTick(550, "moverProyectiles", { 
                self.moverProyectiles()
            })
        }
    }

    method eliminarProyectil(proyectil) {
        proyectiles.remove(proyectil)
        if (proyectiles.isEmpty()) { 
            game.removeTickEvent("moverProyectiles")
        }
    }
}

