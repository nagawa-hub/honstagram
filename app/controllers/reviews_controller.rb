class ReviewsController < ApplicationController
  before_action :authenticate_user!, only:[:create]
  before_action :set_search, only: [:index]
  before_action :set_book, only: [:index,:create]
  
  def index
    @user = @book.user
    @score_average = @book.reviews.average(:review_score)
    tag_id = BookTagRelation.where(book_id: @book.id).pluck(:tag_id)
    @tag = Tag.find(tag_id)
    @reviews = @book.reviews.includes(:user).order("created_at DESC")
    @review = Review.new
  end

  def create
    @review = @book.reviews.create(review_params)
    if @review.valid?
      redirect_to book_reviews_path(@book)
    else
      set_search
      redirect_to action: :index
    end
  end

  private
  def set_search
    @q = Book.ransack(params[:q])
  end

  def set_book
    @book = Book.find(params[:book_id])
  end
  
  def review_params
    params
      .require(:review)
      .permit(:review_comment,:review_score)
      .merge(user_id: current_user.id)
  end
end
