class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.references :user, foreign_key: true
      t.references :followed, foreign_key: { to_table: :users }
      t.timestamps
      
      t.index [:user_id, :followed_id], unique: true
    end
  end
end
