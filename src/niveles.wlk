import enemigos.*
import fortalezas.*
import wollok.game.*

class Nivel {
  const property camino = []
  const listaEnemigos = []
  
  method iniciar() {
    game.addVisual(listaEnemigos.first())
    listaEnemigos.first().animar()
    listaEnemigos.first().seguirCamino(self)
  }
  
  method spawnearEnemigos() {
    listaEnemigos.remove(listaEnemigos.first())
  }
  
  method fondo() {
    game.width(20)
    game.height(20)
    game.cellSize(234)
    return "stage1.png"
  }
}