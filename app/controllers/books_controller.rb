class BooksController < ApplicationController
  before_action :set_search, only: [:top,:index,:new,:show]
  
  def top
    # 最新の投稿
    @new_books = Book.includes(:user).order("created_at DESC").first(8)
  end

  def index
    @books = Book.includes(:user)
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

  def search
    @q = Book.ransack(search_params)
    @results = @q.result.includes(:user).page(params[:page]).per(10)
  end

  private
  def set_search
    @q = Book.ransack(params[:q])
  end

  def search_params
    params
      .require(:q)
      .permit(:title_cont)
  end

  def book_params
    params
      .require(:book)
      .permit(:book_image,:title,:author,:description,:score,:genre_id,:publisher)
      .merge(user_id: current_user.id)
  end
end
