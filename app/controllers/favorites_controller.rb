class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:index]
  before_action :set_search, only: [:index]
  
  def index
    unless current_user.id == @user.id
      redirect_to user_path(@user)
    end
    @post_count = @user.books.count
    @following_count = Relationship.where(user_id: @user.id).count
    @followed_count = Relationship.where(followed_id: @user.id).count
    favorite_ids = Favorite.where(user_id: @user.id).pluck(:book_id)
    @favorite_books = Book.find(favorite_ids)
  end

  def create
    @favorite = current_user.favorites.build(book_id: params[:book_id])
    if @favorite.valid?
      @favorite.save
      redirect_to book_path(@favorite.book_id)
    end
  end

  def destroy
    favorite = current_user.favorites.find_by(book_id: params[:book_id])
    if favorite.valid?
      favorite.destroy
      redirect_to book_path(favorite.book_id)
    end
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end

  def set_search
    @q = Book.ransack(params[:q])
  end
end
