class UsersController < ApplicationController
  before_action :set_user, only: [:show,:edit,:update]
  
  def show
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
  
  def user_params
    params
      .required(:user)
      .permit(:name,:user_image,:user_comment)
  end
end
