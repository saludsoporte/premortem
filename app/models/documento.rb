class Documento < ApplicationRecord
  belongs_to :area_id
  has_one_attached :archivo
end
