// src/jugador.wlk
import wollok.game.*

object jugador {
    var posicion = game.origin().up(1)
    var salud = 100
    var frame = 1
    const fotogramas = 2
    var puntos = 0


    method initialize() {
        game.onCollideDo(self, {elemento => elemento.interactuarConJugador(self)})
    }

    method sumarPuntos(valor) {
        puntos += valor
    }

    var imagen = "soldier_step"

    method image() = imagen + frame + ".png"

    method position(newPosition) {
        posicion = newPosition
    }

    method position() = posicion

    method salud() = salud

    method cambiarImagen(nuevaimagen) {
        imagen = nuevaimagen
    }

    method controlesJugador() {
        keyboard.up().onPressDo({self.moverArriba()})
        keyboard.down().onPressDo({self.moverAbajo()})
        keyboard.left().onPressDo({self.moverIzquierda()})
        keyboard.right().onPressDo({self.moverDerecha()})
    }

    method esJugador() = true

    method esColisionable() = false

    method moverArriba() {
        if(!game.getObjectsIn(posicion.up(1)).any({e => e.esColisionable()})){
            self.position(posicion.up(1))
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
    }


    method recibirDanio(danioRecibido) {
        salud = 0.max(salud - danioRecibido)
        self.barraDeSalud()
        if(salud == 0) {
            self.morir()
        }
    }

    method barraDeSalud() {
        
    }

    method morir() {
        game.removeVisual(self)
    }
}

object barraDeVida {
        const posicion = game.at(0, 12)
        const img = "barraDeVida"

        method position() = posicion

        method image() = img + jugador.salud().toString() + ".png"
    }