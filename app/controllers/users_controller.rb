class UsersController < ApplicationController
  before_action :set_user, only: [:show,:edit,:update]
  before_action :set_search, only: [:show,:edit]
  def show
    @user_books = @user.books
    @post_count = @user_books.count
    @following_count = Relationship.where(user_id: @user.id).count
    @followed_count = Relationship.where(followed_id: @user.id).count
  end

  def edit
    @post_count = @user.books.count
    @following_count = Relationship.where(user_id: @user.id).count
    @followed_count = Relationship.where(followed_id: @user.id).count
  end

  def update
    @user.update(user_params)
    redirect_to action: :show
  end

  def guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password =  SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to root_path
  end
  
  private
  def set_user
    @user = User.find(params[:id])
  end

  def set_search
    @q = Book.ransack(params[:q])
  end

  def user_params
    params
      .required(:user)
      .permit(:name,:user_image,:user_comment)
  end 
end
