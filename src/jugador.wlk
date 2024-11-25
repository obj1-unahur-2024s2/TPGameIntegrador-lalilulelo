import wollok.game.*
import src.fondo.*

object jugador {
    var property posicion = game.origin().up(1).right(1)
    var property salud = 100
    var frame = 1
    const fotogramas = 2
    var property puntos = 0
    var property nivelActual = 0
    const damageAud = "damage.mp3"
    const stepAud = "step.mp3"
    const diedAud = "died.mp3"


    method colision() {
        game.onCollideDo(self, {elemento => elemento.interactuarConJugador(self)})
    }

    method sumarPuntos(valor) {
        puntos = 100.min(puntos + valor)
        if(puntos >= 50) {
            nivelActual.ciclope().despertar()
        }   
    }

    method puntos() = puntos

    var imagen = "soldier_step"

    method image() = imagen + frame + ".png"

    method position(newPosition) {
        posicion = newPosition
    }

    method reiniciarPuntaje() {
        puntos = 0
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
            game.sound(stepAud).play()
        }
    }

    method moverAbajo() {
        if(!game.getObjectsIn(posicion.down(1)).any({e => e.esColisionable()})){
            self.position(posicion.down(1))
            self.moverse()
            game.sound(stepAud).play()
        }
    }

    method moverIzquierda() {
        if(!game.getObjectsIn(posicion.left(1)).any({e => e.esColisionable()})){
            self.position(posicion.left(1))
            self.moverse()
            game.sound(stepAud).play()
        }
    }

    method moverDerecha() {
        if(!game.getObjectsIn(posicion.right(1)).any({e => e.esColisionable()})){
            self.position(posicion.right(1))
            self.moverse()
            game.sound(stepAud).play()
        }
    }

    method moverse() {
        if(frame == fotogramas) frame = 1 else frame = frame + 1
    }

    method recibirDanio(danioRecibido) {
        salud = 0.max(salud - danioRecibido)
        if(salud == 0) {
            self.morir()
        }
        game.sound(damageAud).play()
    }

    method morir() {
        game.removeVisual(self)
        game.sound(diedAud).play()
    }
}

object barraDeVida {
        const posicion = game.at(0, 12)
        const img = "barraDeVida"
        method position() = posicion
        method image() = img + jugador.salud().toString() + ".png"
        method esColisionable() = false

        method interactuarConJugador(jugador) {
        }
    }
