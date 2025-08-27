class AddResponsable < ActiveRecord::Migration[7.1]
  def change
    add_column :documentos, :responsable_de_paciente, :string
  end
end
