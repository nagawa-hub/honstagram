class Notification < ApplicationRecord
  # デフォルトの並び順を降順に
  default_scope -> { order(created_at: :desc) }
  belongs_to :review, optional: true # nilを許可
  belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id', optional: true
  belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true

end
