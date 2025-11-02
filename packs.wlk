// completar
class Packs{
    var duracion
    var precioBase
    const beneficios = #{}
    var coordinador

    method esPremium()

    method cantidadDeBeneficios() = beneficios.size()
    method duracion() = duracion
    method coordinador() = coordinador
    method valorFinal() = precioBase + beneficios.filter({a => a.estaVigente()}).sum({b=>b.costo()})
}

class Nacionales inherits Packs {
  var provinciaDestino
  const actividades = #{}

  method numeroDeActividades() = actividades.size()
  override method esPremium() = (self.duracion() > 10) and coordinador.esAltamenteCalificado()
}

class Provinciales inherits Nacionales {
  var cantidadDeCiudadesAVisitar

  method cantidadDeCiudadesAVisitar() = cantidadDeCiudadesAVisitar
  method tieneAlMenosCuatroActividades() = self.numeroDeActividades() >= 4
  method visitaMasDeCinciCiudades() = cantidadDeCiudadesAVisitar > 5
  method tieneAlMenosTresBeneficios() = self.cantidadDeBeneficios() >= 3
  override method esPremium() = self.visitaMasDeCinciCiudades() and self.tieneAlMenosCuatroActividades() and self.tieneAlMenosTresBeneficios()
  override method valorFinal() = if (self.esPremium()){
    super() * (1 + 0.05) 
  }
  else{
    super()
  }

}

class Internacionales inherits Packs {
  var paisDestino
  var cantidadDeEscalas
  var esDeInteres

  method cantidadDeEscalas() = cantidadDeEscalas
  method esDeInteres() = esDeInteres
  override method valorFinal() = super() * (1 + 0.2)
  override method esPremium() = (self.duracion() > 20) and (self.esDeInteres()) and (self.cantidadDeEscalas() == 0)

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