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
    const fondo = new Fondo(img = "stage.png")
    
    game.addVisual(fondo)
    self.spawnearTorretas()
    self.spawnearMonedas()
    self.spawnearObstaculos()
    self.rodearMapa()
    self.spawnearTrampas()
    game.addVisual(ciclope)
    jugador.reiniciarPuntaje()
    jugador.nivelActual(self)
    game.addVisual(barraDeVida)
    game.addVisualCharacter(jugador)
  }

  method pasarASiguienteNivel() {

        nivel2.iniciar()
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

  method rodearMapa() {
        const paredInvisible1 = new Obstaculo(posicion = game.at(0,-1))
        game.addVisual(paredInvisible1)
        const paredInvisible2 = new Obstaculo(posicion = game.at(1,-1))
        game.addVisual(paredInvisible2)
        const paredInvisible3 = new Obstaculo(posicion = game.at(2,-1))
        game.addVisual(paredInvisible3)
        const paredInvisible4 = new Obstaculo(posicion = game.at(3,-1))
        game.addVisual(paredInvisible4)
        const paredInvisible5 = new Obstaculo(posicion = game.at(4,-1))
        game.addVisual(paredInvisible5)
        const paredInvisible6 = new Obstaculo(posicion = game.at(5,-1))
        game.addVisual(paredInvisible6)
        const paredInvisible7 = new Obstaculo(posicion = game.at(6,-1))
        game.addVisual(paredInvisible7)
        const paredInvisible8 = new Obstaculo(posicion = game.at(7,-1))
        game.addVisual(paredInvisible8)
        const paredInvisible9 = new Obstaculo(posicion = game.at(8,-1))
        game.addVisual(paredInvisible9)
        const paredInvisible10 = new Obstaculo(posicion = game.at(9,-1))
        game.addVisual(paredInvisible10)
        const paredInvisible11 = new Obstaculo(posicion = game.at(10,-1))
        game.addVisual(paredInvisible11)
        const paredInvisible12 = new Obstaculo(posicion = game.at(11,-1))
        game.addVisual(paredInvisible12)
        const paredInvisible13 = new Obstaculo(posicion = game.at(12,-1))
        game.addVisual(paredInvisible13)
        const paredInvisible14 = new Obstaculo(posicion = game.at(13,-1))
        game.addVisual(paredInvisible14)
        const paredInvisible15 = new Obstaculo(posicion = game.at(14,-1))
        game.addVisual(paredInvisible15)
        const paredInvisible16 = new Obstaculo(posicion = game.at(-1,0))
        game.addVisual(paredInvisible16)
        const paredInvisible17 = new Obstaculo(posicion = game.at(-1,1))
        game.addVisual(paredInvisible17)
        const paredInvisible18 = new Obstaculo(posicion = game.at(-1,2))
        game.addVisual(paredInvisible18)
        const paredInvisible19 = new Obstaculo(posicion = game.at(-1,3))
        game.addVisual(paredInvisible19)
        const paredInvisible20 = new Obstaculo(posicion = game.at(-1,4))
        game.addVisual(paredInvisible20)
        const paredInvisible21 = new Obstaculo(posicion = game.at(-1,5))
        game.addVisual(paredInvisible21)
        const paredInvisible22 = new Obstaculo(posicion = game.at(-1,6))
        game.addVisual(paredInvisible22)
        const paredInvisible23 = new Obstaculo(posicion = game.at(-1,7))
        game.addVisual(paredInvisible23)
        const paredInvisible24 = new Obstaculo(posicion = game.at(-1,8))
        game.addVisual(paredInvisible24)
        const paredInvisible25 = new Obstaculo(posicion = game.at(-1,9))
        game.addVisual(paredInvisible25)
        const paredInvisible26 = new Obstaculo(posicion = game.at(-1,10))
        game.addVisual(paredInvisible26)
        const paredInvisible27 = new Obstaculo(posicion = game.at(-1,11))
        game.addVisual(paredInvisible27)
        const paredInvisible28 = new Obstaculo(posicion = game.at(-1,12))
        game.addVisual(paredInvisible28)
        const paredInvisible29 = new ParedInvisible(posicion = game.at(0,13))
        game.addVisual(paredInvisible29)
        const paredInvisible30 = new ParedInvisible(posicion = game.at(1,13))
        game.addVisual(paredInvisible30)
        const paredInvisible31 = new ParedInvisible(posicion = game.at(2,13))
        game.addVisual(paredInvisible31)
        const paredInvisible32 = new ParedInvisible(posicion = game.at(3,13))
        game.addVisual(paredInvisible32)
        const paredInvisible33 = new ParedInvisible(posicion = game.at(4,13))
        game.addVisual(paredInvisible33)
        const paredInvisible34 = new ParedInvisible(posicion = game.at(5,13))
        game.addVisual(paredInvisible34)
        const paredInvisible35 = new ParedInvisible(posicion = game.at(6,13))
        game.addVisual(paredInvisible35)
        const paredInvisible36 = new ParedInvisible(posicion = game.at(7,13))
        game.addVisual(paredInvisible36)
        const paredInvisible37 = new ParedInvisible(posicion = game.at(8,13))
        game.addVisual(paredInvisible37)
        const paredInvisible38 = new ParedInvisible(posicion = game.at(9,13))
        game.addVisual(paredInvisible38)
        const paredInvisible39 = new ParedInvisible(posicion = game.at(10,13))
        game.addVisual(paredInvisible39)
        const paredInvisible40 = new ParedInvisible(posicion = game.at(11,13))
        game.addVisual(paredInvisible40)
        const paredInvisible41 = new ParedInvisible(posicion = game.at(12,13))
        game.addVisual(paredInvisible41)
        const paredInvisible42 = new ParedInvisible(posicion = game.at(13,13))
        game.addVisual(paredInvisible42)
        const paredInvisible43 = new ParedInvisible(posicion = game.at(14,13))
        game.addVisual(paredInvisible43)
        const paredInvisible44 = new Obstaculo(posicion = game.at(15,0))
        game.addVisual(paredInvisible44)
        const paredInvisible45 = new Obstaculo(posicion = game.at(15,1))
        game.addVisual(paredInvisible45)
        const paredInvisible46 = new Obstaculo(posicion = game.at(15,2))
        game.addVisual(paredInvisible46)
        const paredInvisible47 = new Obstaculo(posicion = game.at(15,3))
        game.addVisual(paredInvisible47)
        const paredInvisible48 = new Obstaculo(posicion = game.at(15,4))
        game.addVisual(paredInvisible48)
        const paredInvisible49 = new Obstaculo(posicion = game.at(15,5))
        game.addVisual(paredInvisible49)
        const paredInvisible50 = new Obstaculo(posicion = game.at(15,6))
        game.addVisual(paredInvisible50)
        const paredInvisible51 = new Obstaculo(posicion = game.at(15,7))
        game.addVisual(paredInvisible51)
        const paredInvisible52 = new Obstaculo(posicion = game.at(15,8))
        game.addVisual(paredInvisible52)
        const paredInvisible53 = new Obstaculo(posicion = game.at(15,9))
        game.addVisual(paredInvisible53)
        const paredInvisible54 = new Obstaculo(posicion = game.at(15,10))
        game.addVisual(paredInvisible54)
        const paredInvisible55 = new Obstaculo(posicion = game.at(15,11))
        game.addVisual(paredInvisible55)
        const paredInvisible56 = new Obstaculo(posicion = game.at(15,12))
        game.addVisual(paredInvisible56)
    }

    method reiniciar() {
      keyboard.r().onPressDo({
        game.clear()
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
      jugador.controlesJugador()
    })
  }
  
}

object nivel2 inherits Nivel(listaMonedas = [moneda1,moneda2,moneda3,moneda4,moneda5,moneda6], 
listaTorretas = [torreta1,torreta2,torreta3,torreta4], 
listaObstaculos = [obstaculo1, obstaculo2, obstaculo3, obstaculo4, obstaculo5, obstaculo6, obstaculo7, obstaculo8, obstaculo9,obstaculo10, obstaculo11, 
obstaculo16, obstaculo17,obstaculo18, obstaculo19, obstaculo20, obstaculo24, obstaculo25, obstaculo26, obstaculo27, obstaculo28, obstaculo30, obstaculo31, 
obstaculo32, obstaculo33, obstaculo333,obstaculo334, obstaculo34, obstaculo35, obstaculo36, obstaculo37,obstaculo38, obstaculo39, obstaculo40, obstaculo41, 
obstaculo42, obstaculo43, obstaculo44, obstaculo45, obstaculo46, obstaculo47 ],
listaTrampas = [trampa1,trampa2,trampa3,trampa4,trampa5,trampa6,trampa7,trampa8,trampa9,trampa10,trampa11,trampa12], 
puerta = puertaNivel2, 
ciclope = ciclope1) {
 
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

  
  const moneda1 = new Moneda(valor = 17, posicion = game.at(7,1))
  const moneda2 = new Moneda(valor = 17, posicion = game.at(8,0))
  const moneda3 = new Moneda(valor = 17, posicion = game.at(8,12))
  const moneda4 = new Moneda(valor = 17, posicion = game.at(7,1))
  const moneda5 = new Moneda(valor = 17, posicion = game.at(14,8))
  const moneda6 = new Moneda(valor = 17, posicion = game.at(13,8))
  
  const torreta1 = new Torreta(nroTorreta = 1, rangoAtaque = 10, direccion = 2, velocidadDeBala = 33, posicion = game.at(3, 1))
  const torreta2 = new Torreta(nroTorreta = 1, rangoAtaque = 10, direccion = 4, velocidadDeBala = 33, posicion = game.at(13, 0))
  const torreta3 = new Torreta(nroTorreta = 1, rangoAtaque = 10, direccion = 3, velocidadDeBala = 33, posicion = game.at(14, 12))
  const torreta4 = new Torreta(nroTorreta = 1, rangoAtaque = 10, direccion = 3, velocidadDeBala = 33, posicion = game.at(13, 12))
 
  const ciclope1 = new Ciclope(velocidadMovimiento = 600, posicion = game.at(10, 10))
}

object nivel1 inherits Nivel(
  listaMonedas = [moneda1, moneda2, moneda3, moneda4, moneda5, moneda6], 
listaTorretas = [torreta1, torreta2, torreta3, torreta4], 
listaObstaculos = [obstaculo1, obstaculo2, obstaculo3, obstaculo4, obstaculo5, obstaculo6, obstaculo7, obstaculo9, 
obstaculo10, obstaculo11, obstaculo11, obstaculo13, obstaculo14, obstaculo15, obstaculo16, obstaculo17, obstaculo18, obstaculo19, obstaculo20, obstaculo21,
obstaculo22, obstaculo23, obstaculo24, obstaculo25, obstaculo26, obstaculo27], 
listaTrampas = [trampa1, trampa2,trampa3,trampa4,trampa5,trampa6,trampa7,trampa8,trampa9], 
puerta = puertaNivel1, 
ciclope = ciclope1) {
  
  const obstaculo1 = new Obstaculo(posicion = game.at(2,1))
  const obstaculo2 = new Obstaculo(posicion = game.at(2,2))
  const obstaculo3 = new Obstaculo(posicion = game.at(2,3))
  const obstaculo4 = new Obstaculo(posicion = game.at(2,6))
  const obstaculo5 = new Obstaculo(posicion = game.at(2,7))
  const obstaculo6 = new Obstaculo(posicion = game.at(2,8))
  const obstaculo7 = new Obstaculo(posicion = game.at(2,9))
  const obstaculo8 = new Obstaculo(posicion = game.at(3,12))
  const obstaculo9 = new Obstaculo(posicion = game.at(7,12))
  const obstaculo10 = new Obstaculo(posicion = game.at(7,11))
  const obstaculo11 = new Obstaculo(posicion = game.at(7,8))
  const obstaculo12 = new Obstaculo(posicion = game.at(7,7))
  const obstaculo13 = new Obstaculo(posicion = game.at(7,6))
  const obstaculo14 = new Obstaculo(posicion = game.at(7,5))
  const obstaculo15 = new Obstaculo(posicion = game.at(7,4))
  const obstaculo16 = new Obstaculo(posicion = game.at(7,3))
  const obstaculo17 = new Obstaculo(posicion = game.at(7,2))
  const obstaculo18 = new Obstaculo(posicion = game.at(7,1))
  const obstaculo19 = new Obstaculo(posicion = game.at(7,0))
  const obstaculo20 = new Obstaculo(posicion = game.at(14,10))
  const obstaculo21 = new Obstaculo(posicion = game.at(13,10))
  const obstaculo22 = new Obstaculo(posicion = game.at(12,10))
  const obstaculo23 = new Obstaculo(posicion = game.at(12,9))
  const obstaculo24 = new Obstaculo(posicion = game.at(12,8))
  const obstaculo25 = new Obstaculo(posicion = game.at(12,7))
  const obstaculo26 = new Obstaculo(posicion = game.at(12,6))
  const obstaculo27 = new Obstaculo(posicion = game.at(12,5))
  
  const trampa1 = new Trampa(posicion = game.at(2,4))
  const trampa2 = new Trampa(posicion = game.at(2,5))
  const trampa3 = new Trampa(posicion = game.at(9,12))
  const trampa4 = new Trampa(posicion = game.at(9,11))
  const trampa5 = new Trampa(posicion = game.at(9,10))
  const trampa6 = new Trampa(posicion = game.at(12,1))
  const trampa7 = new Trampa(posicion = game.at(12,2))
  const trampa8 = new Trampa(posicion = game.at(12,3))
  const trampa9 = new Trampa(posicion = game.at(12,4))

  const torreta1 = new Torreta(nroTorreta = 1, rangoAtaque = 5, direccion = 1, velocidadDeBala = 900, posicion = game.at(3, 4))
  const torreta2 = new Torreta(nroTorreta = 2, rangoAtaque = 5, direccion = 1, velocidadDeBala = 700, posicion = game.at(5, 3))
  const torreta3 = new Torreta(nroTorreta = 3, rangoAtaque = 5, direccion = 3, velocidadDeBala = 500, posicion = game.at(12, 9))
  const torreta4 = new Torreta(nroTorreta = 3, rangoAtaque = 5, direccion = 3, velocidadDeBala = 1000, posicion = game.at(14, 0))

  const moneda1 = new Moneda(valor = 10, posicion = game.at(7,3))
  const moneda2 = new Moneda(valor = 10, posicion = game.at(8,2))
  const moneda3 = new Moneda(valor = 10, posicion = game.at(4,9))
  const moneda4 = new Moneda(valor = 10, posicion = game.at(8,10))
  const moneda5 = new Moneda(valor = 10, posicion = game.at(8,9))
  const moneda6 = new Moneda(valor = 50, posicion = game.at(10,12))

  const ciclope1 = new Ciclope(velocidadMovimiento = 1000, posicion = game.at(14, 10))
}