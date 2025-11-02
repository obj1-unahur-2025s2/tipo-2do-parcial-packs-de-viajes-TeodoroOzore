// completar
class Packs{
    var duracion
    var precioBase
    const beneficios = #{}
    var coordinador

    method valorFinal() = precioBase + beneficios.filter({a => a.estaVigente()}).sum({b=>b.costo()})
}

class Nacionales inherits Packs {
  var provinciaDestino
  const actividades = #{}
}

class Internacionales inherits Packs {
  var paisDestino
  var cantidadDeEscalas
  var esDeInteres
  override method valorFinal() = super() * (1 + 0.2)
}

class Coordinadores {
  var viajesRealizados
  var estaMotivado
  var aniosDeExperiencia
  var rol
  const rolesValidos = #{guia, asistenteLogistico, acompaniante}

  method rol() = rol 
  method cambiarDeRol(unRol) {
    if (rolesValidos.contains(unRol)){
        rol = unRol
    }
    else {
        self.error("Rol invalido")
    }
  }
  method aniosDeExperiencia() = aniosDeExperiencia 
  method estaMotivado() = estaMotivado
  method esAltamenteCalificado() = (viajesRealizados > 20) and rol.condicionAdicional(self)
}


 object guia {
   method condicionAdicional(unCoordinador) = unCoordinador.estaMotivado()
 }

 object asistenteLogistico {
   method condicionAdicional(unCoordinador) = unCoordinador.aniosDeExperiencia() >= 3
 }

 object acompaniante {
   method condicionAdicional(unCoordinador) = true
 }

class BeneficiosEspeciales {
  var tipo
  var costo
  var estaVigente

  method costo() = costo
  method estaVigente() = estaVigente
}