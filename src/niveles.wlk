import torretas.*
import enemigos.*
import fortalezas.*
import wollok.game.*

class Nivel {
  const property camino = []
  const listaEnemigos = []
  const listaTorretas = []
  const listaTrincheras = []
  const property fortaleza
  
  method iniciar() {
    game.addVisual(listaEnemigos.first())
    game.addVisual(listaTrincheras.first())
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
    return "Stage1.png"
  }
}