class CreateDireccions < ActiveRecord::Migration[7.1]
  def change
    create_table :direccions do |t|
      t.string :clave
      t.string :nombre
      t.boolean :activo

      t.timestamps
    end
  end
end
