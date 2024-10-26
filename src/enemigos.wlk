import elementos.*

class Enemigo inherits ElementoConSalud {
  override method recibirDanio(cantidadDanio) {
    salud = 0.max(salud - cantidadDanio)
  }
  
  method estaMuerto() = salud == 0
  
  method moverDerecha() {
    posicion += 1
  }
  
  method moverIzquierda() {
    posicion -= 1
  }
  
  method moverArriba() {
    posicion -= 0.1
  }
  
  method moverAbajo() {
    posicion += 0.1
  }
}