import src.elementos.*
import jugador.*
import wollok.game.*
class Obstaculo inherits Elemento {
    const property imagen
    
    method image() = imagen

    method esColisionable() = true

    override method interactuarConJugador(jugador) {
        if(posicion.y() == 0) {
            jugador.posicion(jugador.posicion().x(), jugador.posicion().y()+1)
        } else if(posicion.x() == 0) {
            jugador.posicion(jugador.posicion().x()+1, jugador.posicion().y())
        } else if(posicion.y() == 15) {
            jugador.posicion(jugador.posicion().x(), jugador.posicion().y()-1)
        } else if(posicion.x() == 15) {
            jugador.posicion(jugador.posicion().x()-1, jugador.posicion().y())
        }
    }
}

class Trampa inherits Elemento {
    const property danio
    const property imagen

    method esColisionable() = false

    method imagen() = imagen

    override method interactuarConJugador(jugador) {
        jugador.recibirDanio(self.danio())
  }
}