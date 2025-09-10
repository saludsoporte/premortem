class CreateBusquedas < ActiveRecord::Migration[7.1]
  def change
    create_table :busquedas do |t|
      t.string :nombre_p
      t.string :apellido_pp
      t.string :apellido_mp
      t.string :nombre_n
      t.string :apellido_pn
      t.string :apellido_mn
      t.string :nombre_r
      t.string :apellido_pr
      t.string :apellido_mr
      t.string :nombre_ro
      t.string :apellido_pro
      t.string :apellido_mro
      t.string :no_documento
      t.string :area
      t.date :f_recp
      t.date :f_disp
      t.date :f_clon
      t.string :no_inst
      t.string :no_libro
      t.string :no_notaria
      t.string :no_conclusion
      t.boolean :activa, default: false     
      t.references :user, null: false, foreign_key: true 
      t.string :observaciones
      t.timestamps
    end
  end
end
