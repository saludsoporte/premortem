class Documento < ApplicationRecord
  belongs_to :area_id
  has_one_attached :archivo
  self.per_page=10
end
