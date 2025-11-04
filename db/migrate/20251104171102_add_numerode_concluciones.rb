class AddNumerodeConcluciones < ActiveRecord::Migration[7.1]
  def change
    rename_column :documentos, :no_oficio_de_conclucion, :no_oficio_de_clc_pub        
    add_column :documentos, :no_oficio_de_clc_priv, :string
    add_column :documentos, :no_oficio_de_clc_bioetica, :string
    add_column :busquedas, :no_oficio_de_clc_priv, :string
    add_column :busquedas, :no_oficio_de_clc_bioetica, :string
    rename_column :busquedas, :no_conclusion, :no_oficio_de_clc_pub
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
