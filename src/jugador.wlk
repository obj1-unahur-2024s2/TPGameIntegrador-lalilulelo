import wollok.game.*

object jugador {
    var property posicion = game.origin()
    var salud = 100
    var frame = 1
    const fotogramas = 2


    var imagen = "soldier_step"

    method image() = imagen + frame + ".png"

    method position(newPosition) {
        posicion = newPosition
    }

    method salud() = salud

    method cambiarImagen(nuevaimagen) {
        imagen = nuevaimagen
    }

    method controlesJugador() {
        keyboard.up().onPressDo({self.moverArriba()})
        keyboard.down().onPressDo({self.moverAbajo()})
        keyboard.left().onPressDo({self.moverIzquierda()})
        keyboard.right().onPressDo({self.moverDerecha()})
        keyboard.space().onPressDo({self.interactuar()})
    }

    method esJugador() = true

    method esColisionable() = false

    method moverArriba() {
        if(!game.getObjectsIn(posicion.up(1)).any({e => e.esColisionable()})){
            self.position(posicion.up())
            self.moverse()
        }
    }

    method moverAbajo() {
        if(!game.getObjectsIn(posicion.down(1)).any({e => e.esColisionable()})){
            self.position(posicion.down(1))
            self.moverse()
        }
    }

    method moverIzquierda() {
        if(!game.getObjectsIn(posicion.left(1)).any({e => e.esColisionable()})){
            self.position(posicion.left(1))
            self.moverse()
        }
    }

    method moverDerecha() {
        if(!game.getObjectsIn(posicion.right(1)).any({e => e.esColisionable()})){
            self.position(posicion.right(1))
            self.moverse()
        }
    }

    method moverse() {
        if(frame == fotogramas) frame = 1 else frame = frame + 1
        self.cambiarImagen("soldier_step" + frame + ".png")
    }

    method interactuar() {
        game.onCollideDo(self, {elemento => elemento.interactuarConJugador(self)})
    }

    method recibirDanio(danioRecibido) {
        salud -= danioRecibido
    }
}