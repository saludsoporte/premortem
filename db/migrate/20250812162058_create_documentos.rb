class CreateDocumentos < ActiveRecord::Migration[7.1]
  def change
    create_table :documentos do |t|
      t.date :fecha_recepcion
      t.integer :no_memo
      t.references :area, null: false, foreign_key: true
      t.integer :no_libro
      t.string :nombre
      t.date :fecha_disp
      t.string :notario
      t.integer :no_notaria
      t.integer :no_oficio_de_conclucion
      t.date :fecha_conclucion
      t.string :observaciones

      t.timestamps
    end
  end
end
