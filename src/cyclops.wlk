// src/cyclops.wlk
// src/cyclops.wlk
import niveles.*
import elementos.*
import jugador.*
import wollok.game.*

class Enemigo inherits Elemento {
  const property velocidadMovimiento
  const property danio = 999999
  const imagen = "cyclops"
  var frame = 1
  
  method imagen() = imagen + frame + ".png"

  method seguirJugadorConstantemente(posicionJugador) {
    var movimientoVariable = velocidadMovimiento
    if(!game.getObjectsIn(posicion).any({e => e.esColisionable()})) movimientoVariable /= 2
    game.onTick(velocidadMovimiento, "persecucion", {self.seguirJugador(posicionJugador)})
    game.onTick(500, "animacionCyclops", {self.animacion()})
  }
  
  method seguirJugador(posicionJugador) {
    const jugadorX = posicionJugador.x()
		const jugadorY = posicionJugador.y()
				
		if(jugadorY > posicion.y()){self.posicion(posicion.up(1))}
    else if(jugadorX > posicion.x()){self.posicion(posicion.right(1))}
    else if(jugadorY < posicion.y()){self.posicion(posicion.down(1))}
    else (jugadorX < posicion.x()){self.posicion(posicion.left(1))}
  }

  method animacion() {
    new Range(start = 1, end = 5).anyOne()
    frame = Range
  }

  override method interactuarConJugador(jugador) {
    jugador.recibirDanio(self.danio())
  }
}