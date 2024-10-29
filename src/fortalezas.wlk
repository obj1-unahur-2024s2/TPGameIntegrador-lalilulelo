import elementos.*

class Fortalezas inherits ElementoConSalud {
  override method recibirDanio(cantidadDeDanio) {
    salud = 0.max(salud - cantidadDeDanio)
  }
  
  method estaDestruida() = salud == 0
}