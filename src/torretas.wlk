import wollok.game.*
import elementos.*
import enemigos.*

class Torret1 inherits ElementoAnimado {
  const property nroTorreta = 1
  const property velocidadAtaque = 2000
  const property rangoAtaque = 6
  const property danio = 15
  const property direccionDeMira = null
  var img = ((("torret" + nroTorreta) + "_stance_") + direccionDeMira) + ".png"
  
  method rangoUp() = posicion.y() + rangoAtaque
  
  method rangoRight() = posicion.x() + rangoAtaque
  
  method rangoDown() = posicion.y() - rangoAtaque
  
  method rangoLeft() = posicion.x() - rangoAtaque
  
  method detectarEnemigoContinuamente(cordenada) {
    game.onTick(100, "deteccion", { self.detectarEnemigo(cordenada) })
  }
  
  method detectarEnemigo(cordenada) {
    if (game.getObjectsIn(
        posicion .. game.at(cordenada.x(), cordenada.y())
      ).esEnemigo()) self.atacar()
    else self.reposo()
  }
  
  method atacar() {
    game.onTick(
      velocidadAtaque / 2,
      "animacion",
      { frame = if (frame < cantidadDeFotogramas) frame + 1 else 1 }
    )
    img =
      ((((("torret" + nroTorreta) + "_frame") + frame.toString()) + "_") + direccionDeMira) + ".png"
    return danio
  }
  
  method reposo() {
    game.removeTickEvent("animacion")
    img = ((("torret" + nroTorreta) + "_stance_") + direccionDeMira) + ".png"
  }
}

class Torret2 inherits Torret1 {
  
}

class Torret3 inherits Torret1 {
  
}

object direcciones {
  const property rangoAtaque = 6
  const property direccionDeMira = null
  
  method hayEnemigo(direccion, rango) {
    
  }
}