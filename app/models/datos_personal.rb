class DatosPersonal < ApplicationRecord
  belongs_to :user
  validates :nombre, presence: true
  validates :apellido_paterno, presence: true
  validates :apellido_materno, presence: true
  validates :puesto, presence: true
  validates :titulo, presence: true
  validates :curp, presence: true, length: { is: 18 }, uniqueness: true   
  def nombre_completo
    self.nombre + " " + self.apellido_paterno + " " + self.apellido_materno 
  end
end
