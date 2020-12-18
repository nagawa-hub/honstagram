class UsersController < ApplicationController
  before_action :set_user, only: [:show,:edit,:update]
  before_action :set_search, only: [:show,:edit]
  def show
    @user_books = @user.books
    @post_count = Book.where(user_id: @user.id).count
    @following_count = Relationship.where(user_id: @user.id).count
    @followed_count = Relationship.where(followed_id: @user.id).count
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to action: :show
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
