class AddReferenceUser < ActiveRecord::Migration[7.1]
  def change
    add_reference :buzones, :user, foreign_key: true
  end
end
