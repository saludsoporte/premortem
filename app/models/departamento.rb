class Departamento < ApplicationRecord
  belongs_to :direccion
  belongs_to :subdireccion
end
