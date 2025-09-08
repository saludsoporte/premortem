class AddRolUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :rol, :integer, default: 0, null: false
    add_column :datos_personals, :curp, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
