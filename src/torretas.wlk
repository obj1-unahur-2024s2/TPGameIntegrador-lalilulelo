// src/torretas.wlk
// src/torretas.wlk
// src/torretas.wlk
// src/torretas.wlk
// src/torretas.wlk
// src/torretas.wlk
// src/torretas.wlk
import wollok.game.*
import elementos.*

class Torret1 inherits ElementoAnimado{
    const property nroTorreta = 1
    const property velocidadAtaque = 2000
    const property rangoAtaque = 6
    const property danio = 15
    const property direccionDeMira = null
    var img = "torret" + nroTorreta + "_stance_" + direccionDeMira + ".png"

    /*
    if(enemigoDetectado()) {
        atacar()
    } else {
        reposo()
    }
    */
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