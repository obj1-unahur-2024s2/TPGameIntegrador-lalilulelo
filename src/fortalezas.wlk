import elementos.*

class Fortaleza inherits Elemento {
  var salud
  
  method recibirDanio(cantidadDeDanio) {
    salud = 0.max(salud - cantidadDeDanio)
  }
  
  method estaDestruida() = salud == 0
}