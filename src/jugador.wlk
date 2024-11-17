import wollok.game.*
import torretas.*

object jugador {
    var property posicion = game.origin()
    var torretasPuestas = 0

    method image() = "jugador.png"

    method position() = posicion

    method crearTorreta() {
      keyboard.z().onPressDo({
        if(game.getObjectsIn(posicion).filter({e => e.esTorreta()}).first().estaVacia()){
            const torreta new Torret(idTorreta = torretasPuestas, nroTorreta = 1, rangoAtaque = 5,danio = 20,direccion = 3,posicion = posicion)
            game.addVisual(Torret)
            self.ponerTorreta()
        } else game.say(self, "Ya hay una torreta o no es una trinchera")
      })
    }

    method ponerTorreta() {
        game.getObjectsIn(posicion).filter({e => e.esTorreta()}).first().llenarTrinchera()
        torretasPuestas += 1
    }
}

