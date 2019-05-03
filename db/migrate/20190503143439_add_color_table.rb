class AddColorTable < ActiveRecord::Migration[5.2]
  def change
    create_table :colors do |t|
      t.string :line
      t.string :color 
    end
  end
end
