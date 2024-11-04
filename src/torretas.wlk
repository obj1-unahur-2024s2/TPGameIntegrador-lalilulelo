import wollok.game.*
import elementos.*
import enemigos.*

class Torret1 inherits ElementoAnimado{
    const property nroTorreta = 1
    const property velocidadAtaque = 2000
    const property rangoAtaque = 6
    const property danio = 15
    const property direccionDeMira = null
    var img = "torret" + nroTorreta + "_stance_" + direccionDeMira + ".png"

    method rangoUp() = game.origin().y() + rangoAtaque

    method rangoRight() = game.origin().x() + rangoAtaque

    method rangoDown() = game.origin().y() - rangoAtaque

    method rangoLeft() = game.origin().x() - rangoAtaque

    method detectarEnemigo(cordenada) {
        if(game.origin()..cordenada.esEnemigo()) {
            self.atacar()
        }
    }

    method atacar() {
        game.onTick(velocidadAtaque, "atacar", { self.disparar(direccionDeMira) })
    }

    method disparar(direccion) {
        game.onTick(velocidadAtaque/2, "animacion", { frame = if (frame < cantidadDeFotogramas) frame + 1 else 1 })
        img = ("torret" + nroTorreta + "_frame" + frame.toString()) + "_" + direccionDeMira + ".png"
        return danio
    }

    method reposo() {
        img = "torret" + nroTorreta + "_stance_" + direccionDeMira + ".png"
    }
}

object direcciones {
    const property rangoAtaque = 6
    const property direccionDeMira = null

    method hayEnemigo(direccion, rango) {
        
    }

    
}