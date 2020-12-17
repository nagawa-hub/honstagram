class RelationshipsController < ApplicationController
  before_action :set_user, only: [:create,:destroy]   
  
  def create
    following = current_user.follow(@user)
    if following.valid?
      following.save
      redirect_to user_path(@user)
    end
  end

  def destroy
    following = current_user.unfollow(@user)
    if following.valid? 
      following.destroy
      redirect_to user_path(@user)
    end
  end

  private
  def set_user
    @user = User.find(params[:followed_id])
  end

end
