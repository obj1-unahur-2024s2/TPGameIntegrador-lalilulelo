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
