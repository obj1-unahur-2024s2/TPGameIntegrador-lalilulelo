// src/niveles.wlk
import torretas.*
import enemigos.*
import fortalezas.*
import wollok.game.*

class Nivel {
  const property camino = []
  const listaEnemigos = []
  const listaTorretas = []
  const property fortaleza
  
  method iniciar() {
    game.addVisual(listaEnemigos.first())
    game.addVisual(listaTorretas.first())
    game.addVisual(fortaleza)
    listaEnemigos.first().animar()
    listaTorretas.first().crearAreaDeDisparo()
    listaTorretas.first().detectarEnemigoContinuamente()
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