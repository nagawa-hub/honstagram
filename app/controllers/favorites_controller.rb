class FavoritesController < ApplicationController
  before_action :set_search, only: [:index]
  
  def index
    @user = User.find(params[:user_id])
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
    end
  end

  def destroy
    favorite = current_user.favorites.find_by(book_id: params[:book_id])
    if favorite.valid?
      favorite.destroy
    end
  end

  private
  def set_search
    @q = Book.ransack(params[:q])
  end
end
