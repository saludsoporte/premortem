class Addclues < ActiveRecord::Migration[7.1]
  def change
    add_column :datos_personals, :clues, :string    
  end
end
