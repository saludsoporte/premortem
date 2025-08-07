class AddAreaToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :area_id, :integer
  end
end
