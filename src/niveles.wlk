import enemigos.*
import fortalezas.*
import wollok.game.*

class Nivel {
  const property camino = []
  const listaEnemigos = []
  
  method iniciar() {
    game.onTick(1000, "spawnear-enemigos", { self.spawnearEnemigos() })
  }
  
  method spawnearEnemigos() {
    if (not listaEnemigos.isEmpty()) {
      game.addVisual(listaEnemigos.first())
      listaEnemigos.first().animar()
      listaEnemigos.first().seguirCamino(camino)
      listaEnemigos.remove(listaEnemigos.first())
    }
  }
}