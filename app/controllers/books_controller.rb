class BooksController < ApplicationController
  before_action :set_search, only: [:top,:index,:new,:show,:edit]
  before_action :set_book, only: [:show,:edit,:update]
  
  def top
    @new_books = Book.includes(:user).order("created_at DESC").first(8)
    @ranking_books = Book.find(
                      Favorite.group(:book_id).order("count(book_id) DESC").limit(10).pluck(:book_id)
                    )
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
      set_search
      render :new
    end
  end

  def show
    @user = @book.user
    @reviews = @book.reviews.includes(:user)
    @score_average = @book.reviews.average(:review_score)
    tag_id = BookTagRelation.where(book_id: @book.id).pluck(:tag_id)
    @tag = Tag.find(tag_id)
  end

  def edit
  end

  def update
    if @book.update(update_params)
      redirect_to action: :show
    else
      set_search
      render :edit
    end
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

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params
      .require(:books_tag)
      .permit(:book_image,
              :title,
              :author,
              :description,
              :genre_id,
              :publisher,
              :tag_name
            )
      .merge(user_id: current_user.id)
  end

  def update_params
    params
      .require(:book)
      .permit(:book_image,
              :title,
              :author,
              :description,
              :genre_id,
              :publisher,
            )
      .merge(user_id: current_user.id)
  end
end
