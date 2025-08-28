class Buzone < ApplicationRecord
  belongs_to :documento
  belongs_to :estado
  self.per_page=5
end
