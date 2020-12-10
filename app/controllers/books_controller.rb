class BooksController < ApplicationController
  def top
    @new_books = Book.all
  end

  def index
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)
    if @book.valid?
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
    @reviews = @book.reviews.includes(:user)
  end

  private
  def book_params
    params
      .require(:book)
      .permit(:book_image,:title,:author,:description,:score,:genre_id,:publisher)
      .merge(user_id: current_user.id)
  end
end
