class FavoritesController < ApplicationController

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

end
