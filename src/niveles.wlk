// src/niveles.wlk
// src/niveles.wlk
// src/niveles.wlk
// src/niveles.wlk
// src/niveles.wlk
import jugador.*
import obstaculos.*
import wollok.game.*

class Nivel {

  const listaMonedas  
  const listaTorretas  
  const listaObstaculos
  const listaTrampas
  
  method iniciar() { 
    self.spawnearTorretas()
    self.spawnearMonedas()
    self.spawnearObstaculos()
    self.rodearMapa()
    self.spawnearTrampas()
    game.addVisual(jugador)
    jugador.controlesJugador()
  }
  
  method spawnearTorretas() {
    listaTorretas.forEach({torreta => game.addVisual(torreta)})
  }

  method spawnearMonedas() {
    listaMonedas.forEach({moneda => game.addVisual(moneda)})
  }

  method spawnearObstaculos() {
    listaObstaculos.forEach({obstaculo => game.addVisual(obstaculo)})
  }

  method spawnearTrampas() {
    listaTrampas.forEach({trampa => game.addVisual(trampa)})
  }

  method rodearMapa() {
        const obstaculoa = new Obstaculo(posicion = game.at(0,-1))
        game.addVisual(obstaculoa)
        const obstaculob = new Obstaculo(posicion = game.at(1,-1))
        game.addVisual(obstaculob)
        const obstaculoc = new Obstaculo(posicion = game.at(2,-1))
        game.addVisual(obstaculoc)
        const obstaculod = new Obstaculo(posicion = game.at(3,-1))
        game.addVisual(obstaculod)
        const obstaculoe = new Obstaculo(posicion = game.at(4,-1))
        game.addVisual(obstaculoe)
        const obstaculof = new Obstaculo(posicion = game.at(5,-1))
        game.addVisual(obstaculof)
        const obstaculog = new Obstaculo(posicion = game.at(6,-1))
        game.addVisual(obstaculog)
        const obstaculoh = new Obstaculo(posicion = game.at(7,-1))
        game.addVisual(obstaculoh)
        const obstaculoi = new Obstaculo(posicion = game.at(8,-1))
        game.addVisual(obstaculoi)
        const obstaculoj = new Obstaculo(posicion = game.at(9,-1))
        game.addVisual(obstaculoj)
        const obstaculok = new Obstaculo(posicion = game.at(10,-1))
        game.addVisual(obstaculok)
    }
  
  method fondo() {
    return "Stage1.png"
  }

}