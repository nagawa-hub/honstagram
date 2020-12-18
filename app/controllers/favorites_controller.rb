class FavoritesController < ApplicationController
  before_action :set_search, only: [:index]

  def index
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
