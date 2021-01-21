class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # association
  has_many :books
  has_many :reviews
  has_many :favorites
  has_many :fav_books, through: :favorites, source: :book
  # フォロー機能
  has_many :relationships
  has_many :following_users, through: :relationships, source: :followed
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'followed_id'
  has_many :followed_users, through: :reverse_of_relationships, source: :user
  # 通知機能
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(followed_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(followed_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.following_users.include?(other_user)
  end

  def create_notification_follow!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ?", current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end

  # carrierwave 
  mount_uploader :user_image, UserImageUploader
  
  # validation
  with_options presence: true do
    validates :user_name
  end

end
