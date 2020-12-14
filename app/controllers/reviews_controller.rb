class ReviewsController < ApplicationController
  before_action :set_search, only: [:new]

  def new
    @book = Book.find(params[:book_id])
    @review = Review.new
  end

  def create
    @book = Book.find(params[:book_id])
    @review = @book.reviews.create(review_params)
    if @review.valid?
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  private
  def set_search
    @q = Book.ransack(params[:q])
  end
  
  def review_params
    params
      .require(:review)
      .permit(:review_comment,:review_score)
      .merge(user_id: current_user.id)
  end
end
