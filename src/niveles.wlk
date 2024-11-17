import torretas.*
import enemigos.*
import fortalezas.*
import jugador.*
import wollok.game.*

class Nivel {
  const property camino = []
  const listaEnemigos = []
  const listaTrincheras = []
  const property fortalezas
  
  method iniciar() {
    game.addVisual(listaEnemigos.first())
    game.addVisual(listaTrincheras.first())
    game.addVisual(fortalezas.first())
    listaEnemigos.first().seguirCamino(self)
  }
  
  method spawnearEnemigos() {
    listaEnemigos.remove(listaEnemigos.first())
  }
  
  method fondo() {
    return "Stage1.png"
  }

}