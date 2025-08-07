class CreateDatosPersonals < ActiveRecord::Migration[7.1]
  def change
    create_table :datos_personals do |t|
      t.string :nombre
      t.string :apellidos
      t.string :puesto
      t.string :titulo
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
