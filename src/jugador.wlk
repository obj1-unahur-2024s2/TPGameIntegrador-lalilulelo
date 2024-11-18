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

    method moverArriba() {
        self.position(posicion.up())
        self.moverse()
    }

    method moverAbajo() {
        self.position(posicion.down())
        self.moverse()
    }

    method moverIzquierda() {
        self.position(posicion.left())
        self.moverse()
    }

    method moverDerecha() {
        self.position(posicion.right())
        self.moverse()
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