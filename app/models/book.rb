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

  def favorite?(user)
    favorites.where(user_id: user.id).exists?
  end

  # validation
  with_options presence: true do
    validates :title
    validates :book_image
    validates :author
    validates :description
    validates :genre_id
  end

  with_options numericality: { other_than: 1 } do
    validates :genre_id
  end 

end
