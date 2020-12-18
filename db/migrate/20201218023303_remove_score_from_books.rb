class RemoveScoreFromBooks < ActiveRecord::Migration[6.0]
  def change
    remove_column :books, :score, :integer
  end
end
