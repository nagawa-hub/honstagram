class CreateBookTagRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :book_tag_relations do |t|
      t.references :book, foreign_key: true
      t.references :tag,  foreign_key: true
      t.timestamps
    end
  end
end
