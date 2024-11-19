import src.elementos.*
import jugador.*
import wollok.game.*
class Obstaculo inherits ElementoColisionable {
    const imagen = "roca.png"
    
    method image() = imagen
}

class Trampa inherits Elemento {
    const imagen = "pinchos.png"

    method image() = imagen

    method danio() = 20

    override method interactuarConJugador(jugador) {
        jugador.recibirDanio(self.danio())
    }
}

class ParedInvisible inherits ElementoColisionable {
    const imagen = "hitBox.png"

    method image() = imagen
}