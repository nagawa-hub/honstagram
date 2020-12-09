class Book < ApplicationRecord
  # association
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre

  # validation
  with_options presence: true do
    validates :title
    # validates :image
    validates :author
    validates :description
    validates :score
    validates :genre_id
  end

  with_options numericality: { other_than: 1 } do
    validates :genre_id
  end 

end
