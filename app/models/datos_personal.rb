class DatosPersonal < ApplicationRecord
  belongs_to :user
  def nombre_completo
    self.nombre + " " + self.apellidos 
  end
end
