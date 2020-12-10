class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # association
  has_many :books
  has_many :reviews

  # validation
  with_options presence: true do
    validates :user_name
  end
  
  mount_uploader :user_image, UserImageUploader

end
