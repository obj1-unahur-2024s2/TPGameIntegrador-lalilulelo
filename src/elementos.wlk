import wollok.game.*


class Elemento {
  var property posicion
  
  method position() = posicion

  method interactuarConJugador(jugador) {
    
  }
}


class Background {
  const imagen
  
  method position() = game.origin()
  
  method image() = imagen
}

class ElementoColisionable inherits Elemento {
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