import wollok.game.*

class Elemento {
  var property posicion
  
  method position() = posicion
}

class Background {
  const imagen
  
  method position() = game.origin()
  
  method image() = imagen
}


class Camino inherits Elemento {
  const property esEnemigo = false
  
  method image() = "camino.png"

  method esEnemigo() = false

  method esTrinchera() = false

  method esTorreta() = false
}