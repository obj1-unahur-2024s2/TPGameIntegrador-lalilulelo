// src/niveles.wlk
// src/niveles.wlk
// src/niveles.wlk
// src/niveles.wlk
import torretas.*
import jugador.*
import obstaculos.*
import wollok.game.*
import src.monedas.*
import src.puerta.*
import cyclops.*
import fondo.*

class Nivel {

  const listaMonedas  
  const listaTorretas  
  const listaObstaculos
  const listaTrampas
  const property ciclope
  const property puerta
  
  method iniciar() {
    game.allVisuals().forEach({e => game.removeVisual(e)})
    var obstaculos = [[0,-1], [1,-1], [2,-1], [3,-1], [4,-1], [5,-1], [6,-1], [7,-1], [8,-1], [9,-1], [10,-1], [11,-1], [12,-1], [13,-1], [14,-1], [-1,0], [-1,1], [-1,2], [-1,3], [-1,4], [-1,5], [-1,6], [-1,7], [-1,8], [-1,9], [-1,10], [-1,11], [-1,12], [15,0], [15,1], [15,2], [15,3], [15,4], [15,5], [15,6], [15,7], [15,8], [15,9], [15,10], [15,11], [15,12]]
    var invisibles = [[0,13], [1,13], [2,13], [3,13], [4,13], [5,13], [6,13], [7,13], [8,13], [9,13], [10,13], [11,13], [12,13], [13,13], [14,13]]
    const fondo = new Fondo(img = "stage.png")
    
    game.addVisual(fondo)
    self.spawnearTorretas()
    self.spawnearMonedas()
    self.spawnearObstaculos()
    self.rodearMapa(obstaculos, invisibles)
    self.spawnearTrampas()
    game.addVisual(ciclope)
    jugador.reiniciarPuntaje()
    jugador.nivelActual(self)
    game.addVisual(barraDeVida)
    game.addVisual(jugador)
  }

  method pasarASiguienteNivel() {

        game.clear()
  }
  
  method spawnearTorretas() {
    listaTorretas.forEach({torreta => game.addVisual(torreta) torreta.crearAreaDeDisparo()})
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

  method rodearMapa(obstaculos, invisibles) {
    if(!obstaculos.isEmpty()){
      const obstaculo = new Obstaculo(posicion = game.at(obstaculos.first().first(), obstaculos.last().last()))
      obstaculos.remove(obstaculos.first())
      self.rodearMapa(obstaculos, invisibles)
    } else if (!invisibles.isEmpty()) {
      const invisible = new ParedInvisible(posicion = game.at(invisibles.first().first(), invisibles.last().last()))
      invisibles.remove(invisibles.first())
      self.rodearMapa(obstaculos, invisibles)
    }
  }

    method reiniciar() {
      keyboard.r().onPressDo({
           nivel1.iniciar()
      })
    }
}

object nivel0 inherits Nivel(listaMonedas = [], listaTorretas = [], listaObstaculos = [], listaTrampas = [], puerta = puertaNivel1, ciclope = []) {
  const fondoMenu = new Fondo(img = "menuInicio.png")
  const menuAud = game.sound("menu.mp3")
  override method iniciar() {
    menuAud.play()
    menuAud.shouldLoop(true)
    menuAud.volume(0.20)
    game.addVisual(fondoMenu)
    keyboard.enter().onPressDo({
      menuAud.stop()
      nivel1.iniciar()
      const levelAud = game.sound("level.mp3")
      levelAud.shouldLoop(true)
      levelAud.volume(0.20)
      levelAud.play()
      jugador.salud(100)
      jugador.posicion(game.origin().up(1))
      jugador.puntos(0)
    })
  }
  
}

object nivel1 inherits Nivel(listaMonedas = [moneda1,moneda2,moneda3,moneda4,moneda5,moneda6], 
listaTorretas = [torreta1], 
listaObstaculos = [obstaculo1, obstaculo2, obstaculo3, obstaculo4, obstaculo5, obstaculo6, obstaculo7, obstaculo8, obstaculo9,obstaculo10, obstaculo11, 
obstaculo16, obstaculo17,obstaculo18, obstaculo19, obstaculo20, obstaculo24, obstaculo25, obstaculo26, obstaculo27, obstaculo28, obstaculo30, obstaculo31, 
obstaculo32, obstaculo33, obstaculo333,obstaculo334, obstaculo34, obstaculo35, obstaculo36, obstaculo37,obstaculo38, obstaculo39, obstaculo40, obstaculo41, 
obstaculo42, obstaculo43, obstaculo44, obstaculo45, obstaculo46, obstaculo47 ],
listaTrampas = [trampa1,trampa2,trampa3,trampa4,trampa5,trampa6,trampa7,trampa8,trampa9,trampa10,trampa11,trampa12], 
puerta = puertaNivel2, 
ciclope = ciclope1) {

  override method iniciar() {
    super()
    jugador.controlesJugador()
  }
 
  const levelAud = game.sound("level.mp3")
  const obstaculo1 = new Obstaculo(posicion = game.at(2,0))  
  const obstaculo2 = new Obstaculo(posicion = game.at(2,1))
  const obstaculo3 = new Obstaculo(posicion = game.at(2,2))
  const obstaculo4 = new Obstaculo(posicion = game.at(2,3))
  const obstaculo5 = new Obstaculo(posicion = game.at(2,4))
  const obstaculo6 = new Obstaculo(posicion = game.at(2,5))
  const obstaculo7 = new Obstaculo(posicion = game.at(2,6))
  const obstaculo8 = new Obstaculo(posicion = game.at(2,7))
  const obstaculo9 = new Obstaculo(posicion = game.at(2,8))
  const obstaculo10 = new Obstaculo(posicion = game.at(2,9))
  const obstaculo11 = new Obstaculo(posicion = game.at(2,10))

  
  const obstaculo16 = new Obstaculo(posicion = game.at(5,10))
  const obstaculo17 = new Obstaculo(posicion = game.at(6,10))
  const obstaculo18 = new Obstaculo(posicion = game.at(7,10))
  const obstaculo19 = new Obstaculo(posicion = game.at(8,10))
  const obstaculo20 = new Obstaculo(posicion = game.at(9,10))
  const obstaculo24 = new Obstaculo(posicion = game.at(5,11))
  const obstaculo25 = new Obstaculo(posicion = game.at(6,11))
  const obstaculo26 = new Obstaculo(posicion = game.at(7,11))
  const obstaculo27 = new Obstaculo(posicion = game.at(8,11))
  const obstaculo28 = new Obstaculo(posicion = game.at(9,11))

  const obstaculo30 = new Obstaculo(posicion = game.at(5,3))
  const obstaculo31 = new Obstaculo(posicion = game.at(6,3))
  const obstaculo32 = new Obstaculo(posicion = game.at(7,3))
  const obstaculo33 = new Obstaculo(posicion = game.at(8,3))
  const obstaculo333 = new Obstaculo(posicion = game.at(9,3)) 
  const obstaculo34 = new Obstaculo(posicion = game.at(5,2))
  const obstaculo35 = new Obstaculo(posicion = game.at(6,2))
  const obstaculo36 = new Obstaculo(posicion = game.at(7,2))
  const obstaculo37 = new Obstaculo(posicion = game.at(8,2))
  const obstaculo334 = new Obstaculo(posicion = game.at(9,2))


  const obstaculo38 = new Obstaculo(posicion = game.at(12,3))
  const obstaculo39 = new Obstaculo(posicion = game.at(12,4))
  const obstaculo40 = new Obstaculo(posicion = game.at(12,5))
  const obstaculo41 = new Obstaculo(posicion = game.at(12,6))
  const obstaculo42 = new Obstaculo(posicion = game.at(12,7))
  const obstaculo43 = new Obstaculo(posicion = game.at(12,8))
  const obstaculo44 = new Obstaculo(posicion = game.at(12,9))
  const obstaculo45 = new Obstaculo(posicion = game.at(12,10))
  const obstaculo46 = new Obstaculo(posicion = game.at(12,11))
  const obstaculo47 = new Obstaculo(posicion = game.at(12,12))
  

  const trampa1 = new Trampa(posicion = game.at(0,2))
  const trampa2 = new Trampa(posicion = game.at(0,10))
  const trampa3 = new Trampa(posicion = game.at(1,4))
  const trampa4 = new Trampa(posicion = game.at(1,5))
  const trampa5 = new Trampa(posicion = game.at(1,6))
  const trampa6 = new Trampa(posicion = game.at(1,7))
  const trampa7 = new Trampa(posicion = game.at(1,8))

  const trampa8 = new Trampa(posicion = game.at(5,12))
  const trampa9 = new Trampa(posicion = game.at(6,12))
  const trampa10 = new Trampa(posicion = game.at(7,12))
  const trampa11 = new Trampa(posicion = game.at(3,3))
  const trampa12 = new Trampa(posicion = game.at(4,3))

  
  const moneda1 = new Moneda(valor = 10, posicion = game.at(7,1))
  const moneda2 = new Moneda(valor = 10, posicion = game.at(8,0))
  const moneda3 = new Moneda(valor = 10, posicion = game.at(8,12))
  const moneda4 = new Moneda(valor = 10, posicion = game.at(7,1))
  const moneda5 = new Moneda(valor = 10, posicion = game.at(14,8))
  const moneda6 = new Moneda(valor = 50, posicion = game.at(13,8))
  
  const torreta1 = new Torreta(rangoAtaque = 10, direccion = 2, velocidadDeBala = 33, posicion = game.at(3, 1))
  const torreta2 = new Torreta(rangoAtaque = 10, direccion = 4, velocidadDeBala = 33, posicion = game.at(13, 0))
  const torreta3 = new Torreta(rangoAtaque = 10, direccion = 3, velocidadDeBala = 33, posicion = game.at(14, 12))
  const torreta4 = new Torreta(rangoAtaque = 10, direccion = 3, velocidadDeBala = 33, posicion = game.at(13, 12))
  const torreta5 = new Torreta(rangoAtaque = 10, direccion = 2, velocidadDeBala = 33, posicion = game.at(3, 1))
 
  const ciclope1 = new Ciclope(velocidadMovimiento = 600, posicion = game.at(10, 10))
}


object nivel2 inherits Nivel(listaMonedas = [], listaTorretas = [], listaObstaculos = [], listaTrampas = [], puerta = puertaNivel2, ciclope = []) {

}