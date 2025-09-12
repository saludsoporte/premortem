class ChangeDatosPersonal < ActiveRecord::Migration[7.1]
  def change
    rename_column :datos_personals, :apellidos, :apellido_paterno
    add_column :datos_personals, :apellido_materno, :string
  end
end
