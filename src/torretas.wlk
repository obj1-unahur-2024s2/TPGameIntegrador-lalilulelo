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

object gestorDeTorretas {
    const torretas = [] 

    method agregarTorreta(torreta) {
        torretas.add(torreta)
    }

    method activarTorretas(){
      if (torretas.size() <= 1) { 
            game.onTick(550, "actualizarTorretas", { self.actualizarTorretas() })
        }
    }

    method eliminarTorreta(torreta) {
        torretas.remove(torreta)
        if (torretas.isEmpty()) { 
            game.removeTickEvent("actualizarTorretas")
        }
    }

    method eliminarTodasLasTorretas(){
      torretas.forEach({torreta => self.eliminarTorreta(torreta)})
    }

    method actualizarTorretas() {
        torretas.forEach({ torreta =>
            torreta.actualizarAcciones()
        })
    }
}

class Torreta inherits ElementoColisionable {
  var property idTorreta = gestorDeIds.nuevoId()
  const property velocidadDeBala = 500
  const direccion
  var img = ((("torret1") + "_stance_") + direccion.toString()) + ".png"
  var enCooldown = false
  const tiempoCooldown = 5000

  method image() = img

  method crearTorreta(torreta){
    game.addVisual(torreta)
    gestorDeTorretas.agregarTorreta(self)
  }

  method actualizarAcciones() {
    if (!enCooldown) {
        img = "torret1" + "_frame2_" + direccion.toString() + ".png"
        game.onTick(500, "animacionTorreta" + idTorreta, { self.animacionAtaque() })
        self.dispararProyectil()
        self.activarCooldown()
    }
  }

  method animacionAtaque() {
    img = "torret1"+ "_frame1_" + direccion.toString() + ".png"
    game.removeTickEvent("animacionTorreta" + idTorreta)
  }

  method activarCooldown() {
        enCooldown = true
        game.onTick(tiempoCooldown, "cooldownTorreta" + idTorreta, { self.finalizarCooldown() })
    }

  method finalizarCooldown() {
        enCooldown = false
        game.removeTickEvent("cooldownTorreta" + idTorreta) 
    }
    
  method dispararProyectil() {
      const bala = new Proyectil(
        direccion = direccion, 
        posicion = self.posicion(),
        danio = 20, 
        idBala = gestorDeIds.nuevoId(),
        velocidad = self.velocidadDeBala()
      )

      const shootAud = "shoot.mp3"
      game.addVisual(bala)
      game.sound(shootAud).play()
      controladorDeProyectiles.agregarProyectil(bala)
      bala.moverBala()
  }

  method esTorreta() = true
}

class Proyectil inherits Elemento{
  const imagen = "bala.png"
  method image() = imagen
  var property idBala
  const property danio
  var property direccion
  const property velocidad 
  
  

  

  method moverBala() {
    if (game.getObjectsIn(self.siguientePosicion(self.direccion())).any({e => e.esColisionable()})) {
        self.borrarse()
    } else {
        posicion = self.siguientePosicion(self.direccion())
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
    }

    method activarProyectiles(){
        game.onTick(50, "moverProyectiles", {self.moverProyectiles()})
        }

    method eliminarProyectil(proyectil) {
        proyectiles.remove(proyectil)
        if (proyectiles.isEmpty()) { 
            game.removeTickEvent("moverProyectiles")
        }
    }
}