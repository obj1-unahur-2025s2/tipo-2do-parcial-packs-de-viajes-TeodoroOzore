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
  var añosDeExperiencia
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
}
 object guia {
   
 }

 object asistenteLogistico {
   
 }

 object acompaniante {
   
 }

class BeneficiosEspeciales {
  var tipo
  var costo
  var estaVigente

  method costo() = costo
  method estaVigente() = estaVigente
}

object trasladosPrivados {
  
}

object salasVIP {
  
}

object segurosAdicionales {
  
}