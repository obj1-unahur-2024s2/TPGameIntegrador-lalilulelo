import jugador.*
import obstaculos.*
import wollok.game.*

class Nivel {

  const listaMonedas  
  const listaTorretas  
  const listaObstaculos
  const listaTrampas
  const puerta
  
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
  
  method fondo() {
    return "Stage1.png"
  }

 method terminarNivel() {
  game.clear()
 }
}