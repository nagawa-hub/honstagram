class Review < ApplicationRecord
  # association
  belongs_to :user
  belongs_to :book

  # validation
  with_options presence: true do
    validates :review_comment
    validates :review_score
  end

  validates :review_score, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
