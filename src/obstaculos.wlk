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

    method esColisionable() = false

    method image() = imagen

    override method interactuarConJugador(jugador) {
        jugador.recibirDanio(self.danio())
  }
}