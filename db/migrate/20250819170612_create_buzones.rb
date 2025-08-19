class CreateBuzones < ActiveRecord::Migration[7.1]
  def change
    create_table :buzones do |t|
      t.integer :area_id
      t.boolean :direccion
      t.boolean :subdireccion
      t.boolean :departamento
      t.references :documento, null: false, foreign_key: true
      t.references :estado, null: false, foreign_key: true

      t.timestamps
    end
  end
end
