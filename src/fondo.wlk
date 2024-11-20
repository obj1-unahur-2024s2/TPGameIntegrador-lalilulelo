import wollok.game.*
import src.elementos.*
import src.niveles.*

class Fondo {
  const img

  method image() = img

  method position() = game.at(0,0)

  method esColisionable() = false

  method esJugador() = false
}