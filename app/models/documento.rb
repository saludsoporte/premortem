class Documento < ApplicationRecord
  belongs_to :area
  has_one_attached :archivo 
  validates :fecha_recepcion , presence: true
  validates :no_memo, presence: true  
  validates :no_libro, presence: true
  validates :nombre, presence: true
  validates :fecha_disp, presence: true
  validates :notario, presence: true
  validates :no_notaria, presence: true
  validates :no_oficio_de_conclucion, presence: true  
  validates :responsable_de_paciente, presence: true
  validates :archivo, attached: true, content_type: ['application/pdf','image/png','image/jpeg'] 

  self.per_page=10
end
