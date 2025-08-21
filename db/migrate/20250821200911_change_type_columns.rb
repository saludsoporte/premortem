class ChangeTypeColumns < ActiveRecord::Migration[7.1]
  def change
    change_column :documentos, :no_memo, :string
    change_column :documentos, :no_libro, :string
    change_column :documentos, :no_notaria, :string
    change_column :documentos, :no_oficio_de_conclucion, :string        
  end
end
