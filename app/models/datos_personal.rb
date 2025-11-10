class DatosPersonal < ApplicationRecord
  belongs_to :user
  has_one_attached :carta
  validates :nombre, presence: true
  validates :apellido_paterno, presence: true
  validates :apellido_materno, presence: true
  validates :puesto, presence: true
  validates :titulo, presence: true
  validates :curp, presence: true, length: { is: 18 }, uniqueness: true   
  validates :correo, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: false
  validates :carta, attached: true, content_type: ['application/pdf','image/png','image/jpeg'] 
  
  def nombre_completo        
    if self.user.username == 'admin'
      return "Administrador del Sistema"
    else
      return self.nombre + " " + self.apellido_paterno + " " + self.apellido_materno    
    end    
  end
end
