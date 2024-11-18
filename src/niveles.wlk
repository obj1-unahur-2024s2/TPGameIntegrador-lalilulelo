import torretas.*
import jugador.*
import wollok.game.*

class Nivel {

  const listaMonedas = []
  const listaTorretas = []



  method iniciar() { 
    self.spawnearTorretas()
    self.spawnearMonedas()
    game.addVisualCharacter(jugador)
  }
  
  method spawnearTorretas() {
    listaTorretas.forEach({enemigo => game.addVisual(enemigo)})

  }

  method spawnearMonedas() {
    listaMonedas.forEach({moneda => game.addVisual(moneda)})
  }
  
  method fondo() {
    return "Stage1.png"
  }

}