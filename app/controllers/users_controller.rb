class UsersController < ApplicationController
  before_action :set_user, only: [:show,:edit,:update,:dashboard,:following_user,:followed_user]
  before_action :set_search, only: [:show,:edit,:dashboard,:following_user,:followed_user]
  before_action :set_user_count, only: [:show,:edit,:followed_user,:following_user]
  
  def show
    @user_books = @user.books
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to action: :show
    else
      set_search
      render :edit
    end
  end

  def guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password =  SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to root_path
  end

  def dashboard
    @user_books = @user.books
    @monthly_count = @user_books.group(:created_at).count
    initial_genre = @user_books.group(:genre_id).count
    convert_table = {1=>"小説・文芸",2=>"社会・ビジネス",3=>"旅行・地図",4=>"趣味",5=>"実用・教育",6=>"アート・教養・エンタメ",
                     7=>"語学・辞書",8=>"こども",9=>"雑誌",10=>"コミック・ラノベ",11=>"その他"}
    @user_genre = initial_genre.map{|k,v| [convert_table[k], v]}
  end

  def followed_user
    @followed_users = User.find(
                        Relationship.where(followed_id: @user.id).order("created_at DESC").pluck(:user_id)
                      )
  end

  def following_user
    @following_users = User.find(
                        @user.relationships.order("created_at DESC").pluck(:followed_id)
                      )
  end
  
  private
  def set_user
    @user = User.find(params[:id])
  end

  def set_user_count
    @post_count = @user.books.count
    @following_count = Relationship.where(user_id: @user.id).count
    @followed_count = Relationship.where(followed_id: @user.id).count
  end

  def set_search
    @q = Book.ransack(params[:q])
  end

  def user_params
    params
      .required(:user)
      .permit(:user_name,:user_image,:user_comment,:email)
  end

end
