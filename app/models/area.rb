class Area < ApplicationRecord
  has_many :documentos
  has_many :buzones
  belongs_to :user
end
