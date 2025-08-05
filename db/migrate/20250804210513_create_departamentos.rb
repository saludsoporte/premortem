class CreateDepartamentos < ActiveRecord::Migration[7.1]
  def change
    create_table :departamentos do |t|
      t.string :clave
      t.string :nombre
      t.boolean :activo
      t.references :direccion, null: false, foreign_key: true
      t.references :subdireccion, null: false, foreign_key: true

      t.timestamps
    end
  end
end
