class NuevasFechas < ActiveRecord::Migration[7.1]
  def change
    rename_column :documentos, :fecha_conclucion, :fecha_clc_pub
    add_column :documentos, :fecha_clc_priv, :date
    add_column :documentos, :fecha_clc_bioetica, :date
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")

  end
end
