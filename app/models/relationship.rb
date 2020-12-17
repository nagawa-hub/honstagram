class Relationship < ApplicationRecord
  # association
  belongs_to :user
  belongs_to :followed, class_name: 'User'

  # validation
  with_options presence: true do
    validates :user_id
    validates :followed_id
  end
end
