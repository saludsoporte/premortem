class AddApellidos < ActiveRecord::Migration[7.1]
  def change
    rename_column :documentos, :nombre, :nombre_paciente
    add_column :documentos, :apellido_p_paciente, :string
    add_column :documentos, :apellido_m_paciente, :string

    rename_column :documentos, :notario, :nombre_notario
    add_column :documentos, :apellido_p_notario, :string
    add_column :documentos, :apellido_m_notario, :string

    rename_column :documentos, :responsable_de_paciente, :nombre_responsable
    add_column :documentos, :apellido_p_responsable, :string
    add_column :documentos, :apellido_m_responsable, :string

    add_column :documentos, :nombre_res_op, :string
    add_column :documentos, :apellido_p_res_op, :string
    add_column :documentos, :apellido_m_res_op, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
    add_column :documentos, :no_instrumento, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
    rename_column :documentos, :no_memo, :no_documento
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
