class Documento < ApplicationRecord
  belongs_to :area
  has_one_attached :archivo 
  validates :fecha_recepcion , presence: true
  validates :no_documento, presence: true  
  validates :no_libro, presence: true

  validates :nombre_paciente, presence: true
  validates :apellido_p_paciente, presence: true
  validates :apellido_m_paciente, presence: true

  validates :nombre_responsable, presence: true
  validates :apellido_p_responsable, presence: true
  validates :apellido_m_responsable, presence: true

  validates :nombre_notario, presence: true
  validates :apellido_p_notario, presence: true
  validates :apellido_m_notario, presence: true

  validates :no_instrumento, presence: true
  validates :fecha_disp, presence: true  
  validates :no_notaria, presence: true
  validates :no_oficio_de_conclucion, presence: true  
  
  validates :archivo, attached: true, content_type: ['application/pdf','image/png','image/jpeg'] 

  self.per_page=10
end
