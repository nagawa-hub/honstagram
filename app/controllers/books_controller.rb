class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:edit,:update]
  before_action :set_search, only: [:top,:index,:new,:show,:edit,:search_book]
  before_action :set_book, only: [:show,:edit,:update]
  
  def top
    @new_books = Book.includes(:user).order("id DESC").first(8)
    @ranking_books = Book.find(
                      Favorite.group(:book_id).order("count(book_id) DESC").limit(10).pluck(:book_id)
                    )
    @genres = Book.group(:genre_id).order("genre_id ASC")
  end

  def index
    @books = Book.includes(:user).order("id DESC").page(params[:page]).per(10)
    @books_count = Book.all.count
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
    @score_average = @book.reviews.average(:review_score)
    tag_id = BookTagRelation.where(book_id: @book.id).pluck(:tag_id)
    @tag = Tag.find(tag_id)
    @randoms = Book.order("RAND()").limit(8)
    @review = Review.new
  end

  def edit
    unless current_user.id == @book.user_id
      redirect_to action: :show
    end
  end

  def update
    if @book.update(update_params)
      redirect_to action: :show
    else
      set_search
      render :edit
    end
  end

  def search_book
    if params[:q][:title_or_author_cont].present?
      @search = params[:q][:title_or_author_cont]
    elsif params[:q][:genre_id_eq].present?
      @genre_id = params[:q][:genre_id_eq].to_i
    else
      redirect_to action: :index
    end
    @results = @q.result.includes(:user).order("id DESC").page(params[:page]).per(10)
    @results_count = @results.count
  end

  private
  def set_search
    @q = Book.ransack(params[:q]) 
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
