class AddColumnsBusqueda < ActiveRecord::Migration[7.1]
  def change
    add_column :busquedas, :f_publicas, :date
    add_column :busquedas, :f_privadas, :date
    add_column :busquedas, :f_bioetica, :date 
  end
end
