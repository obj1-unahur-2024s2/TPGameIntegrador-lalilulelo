// src/niveles.wlk
// src/niveles.wlk
// src/niveles.wlk
// src/niveles.wlk
import src.torretas.*
import src.jugador.*
import src.obstaculos.*
import wollok.game.*
import src.monedas.*
import src.puerta.*
import src.cyclops.*
import src.fondo.*

class Nivel {
  const property listaObstaculos
  const property listaTrampas
  const property listaMonedas
  const property listaTorretas
  var property ciclope
  const property puerta
  const property ost = game.sound("level.mp3")
  const bordes = [[0,-1], [1,-1], [2,-1], [3,-1], [4,-1], [5,-1], [6,-1], [7,-1], [8,-1], [9,-1], [10,-1], [11,-1], [12,-1], [13,-1], [14,-1], [-1,0], [-1,1], [-1,2], [-1,3], [-1,4], [-1,5], [-1,6], [-1,7], [-1,8], [-1,9], [-1,10], [-1,11], [-1,12], [0,13], [1,13], [2,13], [3,13], [4,13], [5,13], [6,13], [7,13], [8,13], [9,13], [10,13], [11,13], [12,13], [13,13], [14,13],[15,0], [15,1], [15,2], [15,3], [15,4], [15,5], [15,6], [15,7], [15,8], [15,9], [15,10], [15,11], [15,12]]
  const fondo = new Fondo(img = "stage.png")
  var property muted = false

  method iniciar() {
    self.spawnearElementos(bordes, fondo)
    self.generarEstructuras(listaObstaculos, listaTrampas, listaMonedas, listaTorretas)
    jugador.nivelActual()
    self.inicializarAudio()
    self.inicializarJugador()
    self.botones()
    jugador.nivelActual(self)
  }

  method botones() {
    self.mutear()
    self.reiniciar()
  }
  
  method spawnearElementos(bordesMapa, fondoMapa){
    const bordesCopy = []
    bordesCopy.addAll(bordes)
    game.addVisual(fondo)
    self.rodearMapa(bordesCopy)
  }

  method spawnearCiclope() {
    game.addVisual(self.ciclope())
  }

  method rodearMapa(invisibles) {
    if (!invisibles.isEmpty()) {
      const invisible = new ParedInvisible(posicion = game.at(invisibles.first().first(), invisibles.first().last()))
      game.addVisual(invisible)
      invisibles.remove(invisibles.first())
      self.rodearMapa(invisibles)
    }
  }

  method generarEstructuras(obstaculos, trampas, monedas, torretas) {
    const obstCopy = []
    const trampCopy = []
    const monCopy = []
    const torCopy = []
    obstCopy.addAll(obstaculos)
    trampCopy.addAll(trampas)
    monCopy.addAll(monedas)
    torCopy.addAll(torretas)
    self.generarObstaculos(obstCopy)
    self.generarTrampas(trampCopy)
    self.generarMonedas(monCopy)
    self.generarTorretas(torCopy)
    self.spawnearCiclope()
  }

  method generarObstaculos(obstaculos) {
    if (!obstaculos.isEmpty()) {
      const obstaculo = new Obstaculo(posicion = game.at(obstaculos.first().first(), obstaculos.first().last()))
      game.addVisual(obstaculo)
      obstaculos.remove(obstaculos.first())
      self.generarObstaculos(obstaculos)
    }
  }

  method generarTrampas(trampas) {
    if (!trampas.isEmpty()) {
      const trampa = new Trampa(posicion = game.at(trampas.first().first(), trampas.first().last()))
      game.addVisual(trampa)
      trampas.remove(trampas.first())
      self.generarTrampas(trampas)
    }
  }

  method generarMonedas(monedas) {
    if (!monedas.isEmpty()) {
      const moneda = new Moneda(posicion = game.at(monedas.first().first(), monedas.first().last()))
      game.addVisual(moneda)
      monedas.remove(monedas.first())
      self.generarMonedas(monedas)
    }
  }

  method generarTorretas(torretas) {
    if (!torretas.isEmpty()) {
      const torreta = new Torreta(posicion = game.at(torretas.first().first(), torretas.first().get(1)), direccion = torretas.first().last())
      game.addVisual(torreta)
      torretas.remove(torretas.first())
      self.generarTorretas(torretas)
    }
  }

  method inicializarAudio() {
    self.ost().shouldLoop(true)
    self.ost().volume(0.05)
    self.ost().play()
  }

  method mutear() {
    keyboard.m().onPressDo({
      if(!muted){
        self.ost().volume(0)
        muted = true
      } else {
        self.ost().volume(0.10) 
        muted = false
      }
    })
  }

  method quitarAudio() {
    muted = true
  }

  method inicializarJugador() {
    jugador.salud(100)
    jugador.posicion(game.origin())
    jugador.puntos(0)
    game.addVisual(jugador)
    game.addVisual(barraDeVida)
    jugador.controlesJugador()
    jugador.colision()
  }

  method reiniciar() {
    keyboard.r().onPressDo({
      self.ost().stop()
      game.clear()
      nivel1.ciclope(new Ciclope(velocidadMovimiento = 1000, posicion = game.at(10, 10)))
      nivel2.ciclope(new Ciclope(velocidadMovimiento = 1000, posicion = game.at(10, 10)))
      self.iniciar()
    })
  }
}
object menu{
  method abrir() {
    const fondoMenu = new Fondo(img = "menuImage.png")
    const menuAud = game.sound("menu.mp3")
    menuAud.play()
    menuAud.shouldLoop(true)
    menuAud.volume(0.20)
    game.addVisual(fondoMenu)
    keyboard.enter().onPressDo({
      menuAud.stop()
      game.removeVisual(fondoMenu)
      nivel1.iniciar()
    })
  }
}

object nivel1 inherits Nivel(
  listaObstaculos = [[2,0], [2,1], [2,2], [2,3], [2,4], [2,5], [2,6], [2,7], [2,8], [2,9], [2,10], [5,10], [6,10], [7,10], [8,10], [9,10], [5,11], [6,11], [7,11], [8,11], [9,11], [5,3], [6,3], [7,3], [8,3], [9,3], [5,2], [6,2], [7,2], [8,2], [9,2], [12,3], [12,4], [12,5], [12,6], [12,7], [12,8], [12,9], [12,10], [12,11], [12,12]],
  listaTrampas = [[0,2], [0,10], [1,4], [1,5], [1,6], [1,7], [1,8], [5,12], [6,12], [7,12], [3,3], [4,3]],
  listaMonedas = [[4,1], [3,1], [8,12], [13,11], [14,11]],
  listaTorretas = [[3,2,3], [4,2,3], [13,12,3], [14,12,3]],
  ciclope = new Ciclope(velocidadMovimiento = 1000, posicion = game.at(10, 10)),
  puerta = puertaNivel1) {}

object nivel2 inherits Nivel(
  listaObstaculos = [[1,0], [1,1], [1,2], [1,3], [1,4], [1,5], [1,6], [2,6], [2,7], [2,8], [2,9], [2,10], [1,10], [1,11], [2,11], [5,12], [5,11], [5,10], [5,9], [5,8], [5,7], [5,6], [5,5], [5,4], [5,3], [5,2], [6,2], [7,2], [8,2], [9,2], [10,2], [7,10], [8,10], [9,10], [10,10], [11,10], [12,10], [13,10], [13,9], [13,8], [13,7], [13,6], [13,5], [13,4], [13,3], [13,2], [13,1], [13,0]],
  listaTrampas = [[0,8], [3,11], [4,9], [3,7], [2,5], [4,5], [3,3], [3,2], [3,1], [3,0], [5,1], [7,0], [9,1], [10,1], [11,2], [12,0], [6,6], [7,3], [7,4], [7,6], [7,7], [7,8], [8,6], [9,4], [9,5], [9,8], [9,11], [10,7], [11,6], [11,4], [11,3], [11,7], [11,9], [12,7], [6,12], [7,12], [10,11], [11,11]],
  listaMonedas = [[2,0], [1,8], [6,3], [12,9], [14,2]],
  listaTorretas = [[14,12,3]],
  ciclope = new Ciclope(velocidadMovimiento = 800, posicion = game.at(14, 0)),
  puerta = puertaNivel2) {}