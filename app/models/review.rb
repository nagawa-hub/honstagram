class Review < ApplicationRecord
  # association
  belongs_to :user
  belongs_to :book

  # validation
  with_options presence: true do
    validates :review_comment
    validates :review_score
  end
end
