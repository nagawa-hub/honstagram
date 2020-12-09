class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string  :title,       null: false
      t.string  :author,      null: false
      t.text    :description, null: false
      t.integer :score,       null: false
      t.integer :genre_id,    null: false
      t.string  :publisher

      t.references :user, foreign_key: true 
      t.timestamps
    end
  end
end
