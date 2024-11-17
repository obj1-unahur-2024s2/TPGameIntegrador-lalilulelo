import wollok.game.*
import torretas.*

object jugador {
    var property posicion = game.origin()
    var torretasPuestas = 0

    method image() = "jugador.png"

    method position() = posicion

    method position(newPosition) {
        posicion = newPosition
    }

    method controlesJugador() {
      keyboard.z().onPressDo{self.ponerTorreta()}
    }

    method ponerTorreta() {
        if(game.getObjectsIn(posicion).any({e => e.esTrinchera()}) && game.getObjectsIn(posicion).filter({e => e.esTrinchera()}).first().estaVacia()){
            const torreta new Torret(idTorreta = torretasPuestas, nroTorreta = 1, rangoAtaque = 5,danio = 20,direccion = 3,posicion = posicion)
            game.addVisual(torreta)
            game.getObjectsIn(posicion).filter({e => e.esTrinchera()}).first().llenarTrinchera()
            torretasPuestas += 1
        } else game.say(self, "Ya hay una torreta o no es una trinchera")
    }

    method esEnemigo() = false

    method esTrinchera() = false

    method esTorreta() = false
}

