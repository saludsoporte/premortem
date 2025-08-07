class CreateAreas < ActiveRecord::Migration[7.1]
  def change
    create_table :areas do |t|
      t.string :clave
      t.string :nombre
      t.string :depende_de

      t.timestamps
    end
  end
end
