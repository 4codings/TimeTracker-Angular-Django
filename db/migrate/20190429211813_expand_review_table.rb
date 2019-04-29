class ExpandReviewTable < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :up_votes, :integer
    add_column :reviews, :down_votes, :integer
    add_column :reviews, :user_id, :integer
    add_foreign_key :reviews, :users
  end
end
