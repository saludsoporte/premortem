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
  
  validates :fecha_clc_pub, presence: true
  validates :fecha_clc_priv, presence: true
  validates :fecha_clc_bioetica, presence: true
  #validates :no_oficio_de_conclucion, presence: true  
  
  validates :archivo, attached: true, content_type: ['application/pdf','image/png','image/jpeg'] 

  self.per_page=10
  def nombre_completo
    "#{nombre_paciente} #{apellido_p_paciente} #{apellido_m_paciente}"
  end
  def nombre_completo_responsable
    "#{nombre_responsable} #{apellido_p_responsable} #{apellido_m_responsable}"
  end
  def nombre_completo_notario
    "#{nombre_notario} #{apellido_p_notario} #{apellido_m_notario}"
  end
  def nombre_completo_responsable_op
    "#{nombre_res_op} #{apellido_p_res_op} #{apellido_m_res_op}"    
  end
end
