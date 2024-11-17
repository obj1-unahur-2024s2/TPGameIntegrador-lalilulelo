import niveles.*
import elementos.*
import jugador.*
import wollok.game.*

class Enemigo inherits Elemento {
  const property velocidadMovimiento
  const property danio = 999999

  method imagen() = "cyclops.png"

  method seguirJugadorConstantemente(posicionJugador) {
    game.onTick(velocidadMovimiento, "persecucion", {self.seguirJugador(posicionJugador)})
  }
  
  method seguirJugador(posicionJugador) {
    const jugadorX = posicionJugador.x()
		const jugadorY = posicionJugador.y()
				
		if(jugadorX < posicion.x()){self.posicion(posicion.left(1))}
    else if(jugadorX > posicion.x()){self.posicion(posicion.right(1))}
    else if(jugadorY < posicion.y()){self.posicion(posicion.down(1))}
    else (jugadorY > posicion.y()){self.posicion(posicion.up(1))}
  }

  method atacar() {
    game.onCollideDo(self, {elemento => if(elemento.esJugador()) self.chocarConJugador()})
  }

  method chocarConJugador() {
    jugador.recibirDanio(self.danio())
  }
}