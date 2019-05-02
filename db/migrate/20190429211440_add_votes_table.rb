class AddVotesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.integer :vote_value

      t.belongs_to :review
      t.belongs_to :user

      t.timestamps
    end
  end
end
