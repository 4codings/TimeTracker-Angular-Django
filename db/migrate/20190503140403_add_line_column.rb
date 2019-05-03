class AddLineColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :stops, :line, :string
  end
end
