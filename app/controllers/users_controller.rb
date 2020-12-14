class UsersController < ApplicationController
  before_action :set_user, only: [:show,:edit,:update]
  before_action :set_search, only: [:show,:edit]
  def show
    @user = User.find(params[:id])
    @user_books = @user.books
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
