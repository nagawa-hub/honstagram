class Book < ApplicationRecord
  # association
  belongs_to :user
  has_many :reviews
  has_many :book_tag_relations
  has_many :tags, through: :book_tag_relations
  has_one_attached :book_image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  
  # お気に入り機能
  has_many :favorites
  has_many :users, through: :favorites
  # 通知機能
  has_many :notifications, dependent: :destroy



  def favorite?(user)
    favorites.where(user_id: user.id).exists?
  end

  def create_notification_review!(current_user, review_id)
    notification = current_user.active_notifications.new(
      visited_id: user_id,
      book_id: id,
      review_id: review_id,
      action: 'review'
    )
    notification.save if notification.valid?
  end

  # validation
  with_options presence: true do
    validates :title
    validates :book_image
    validates :author
    validates :description
    validates :genre_id
  end

end
