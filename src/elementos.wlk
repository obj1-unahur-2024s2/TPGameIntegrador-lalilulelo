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

class ElementoAnimado inherits Elemento {
  var frame = 1
  const cantidadDeFotogramas = 2
  
  method animar() { 
    game.onTick(500, "animacion", { frame = if (frame < cantidadDeFotogramas) frame + 1 else 1 })
  }
}

class Camino inherits Elemento {
  const property esEnemigo = false
  
  method image() = "camino.png"
}