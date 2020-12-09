class Book < ApplicationRecord
  # association
  belongs_to :user

  # validation
  with_options presence: true do
    validates :title
    # validates :image
    validates :author
    validates :description
    validates :score
    validates :genre_id
  end
end
