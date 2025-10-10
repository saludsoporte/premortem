class Buzone < ApplicationRecord
  belongs_to :documento
  belongs_to :estado
  belongs_to :user
  self.per_page=5
end
