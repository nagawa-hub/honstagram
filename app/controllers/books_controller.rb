class BooksController < ApplicationController
  before_action :set_search, only: [:top,:index,:new,:show]
  
  def top
    # 最新の投稿
    @new_books = Book.includes(:user).order("created_at DESC").first(8)
  end

  def index
    @books = Book.includes(:user).order("created_at DESC").page(params[:page]).per(20)
  end

  def new
    @book = BooksTag.new
  end

  def create
    @book = BooksTag.new(book_params)
    if @book.valid?
      @book.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @reviews = @book.reviews.includes(:user)
    @score_average = @book.reviews.average(:review_score)
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
      .require(:books_tag)
      .permit(:book_image,
              :title,
              :author,
              :description,
              :score,
              :genre_id,
              :publisher,
              :tag_name
            )
      .merge(user_id: current_user.id)
  end
end
