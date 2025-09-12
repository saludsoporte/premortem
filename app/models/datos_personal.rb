class DatosPersonal < ApplicationRecord
  belongs_to :user
  def nombre_completo
    self.nombre + " " + self.apellido_paterno + " " + self.apellido_materno 
  end
end
