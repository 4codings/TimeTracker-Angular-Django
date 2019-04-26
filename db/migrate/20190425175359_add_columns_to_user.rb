class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_name,:string,null:false
    add_column :users, :admin, :boolean
  end
end
