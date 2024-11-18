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
        const obstaculoa new Obstaculo(posicion = game.at(0, 0), imagen = "roca.png")
        const obstaculob new Obstaculo(posicion = game.at(1, 0), imagen = "roca.png")
        const obstaculoc new Obstaculo(posicion = game.at(2, 0), imagen = "roca.png")
        const obstaculod new Obstaculo(posicion = game.at(3, 0), imagen = "roca.png")
        const obstaculoe new Obstaculo(posicion = game.at(4, 0), imagen = "roca.png")
        const obstaculof new Obstaculo(posicion = game.at(5, 0), imagen = "roca.png")
        const obstaculog new Obstaculo(posicion = game.at(6, 0), imagen = "roca.png")
        const obstaculoh new Obstaculo(posicion = game.at(7, 0), imagen = "roca.png")
        const obstaculoi new Obstaculo(posicion = game.at(8, 0), imagen = "roca.png")
        const obstaculoj new Obstaculo(posicion = game.at(9, 0), imagen = "roca.png")
        const obstaculok new Obstaculo(posicion = game.at(10, 0), imagen = "roca.png")
    }
  
  method fondo() {
    return "Stage1.png"
  }

}