import src.elementos.*
import jugador.*
import wollok.game.*
class Obstaculo inherits ElementoColisionable {
    const imagen = "roca.png"
    
    method image() = imagen
}

class Trampa inherits Elemento {
    const property danio
    const imagen = "pinchos.png"

    method image() = imagen

    override method interactuarConJugador(jugador) {
        jugador.recibirDanio(self.danio())
  }
}

class ParedInvisible inherits ElementoColisionable {
    const imagen = "hitBox.png"

    method image() = imagen
}