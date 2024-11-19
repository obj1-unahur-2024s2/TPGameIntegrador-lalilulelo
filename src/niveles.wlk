import jugador.*
import wollok.game.*

class Nivel {

  const listaMonedas  
  const listaTorretas  
  const listaObstaculos
  
  method iniciar() { 
    self.spawnearTorretas()
    self.spawnearMonedas()
    self.spawnearObstaculos()
    game.addVisual(jugador)
    jugador.controlesJugador()
  }
  
  method spawnearTorretas() {
    listaTorretas.forEach({torreta => torreta.crearTorreta(torreta)}) 
  }

  method spawnearMonedas() {
    listaMonedas.forEach({moneda => game.addVisual(moneda)})
  }

  method spawnearObstaculos() {
    listaObstaculos.forEach({obstaculo => game.addVisual(obstaculo)})
  }
  
  method fondo() {
    return "Stage1.png"
  }

}