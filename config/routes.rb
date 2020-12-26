Rails.application.routes.draw do
  devise_for :users
  post '/users/guest_sign_in', to: 'users#guest'
  root to: "books#top"
  
  resources :users, only: [:show,:edit,:update] do
    member do
      get :following_user,:followed_user
    end
    resources :favorites, only: [:index]
  end

  resources :relationships, only: [:create, :destroy]
  
  resources :books, only: [:index,:new,:create,:show,:edit,:update] do
    collection do
      get :top,:search_book
    end
    resources :reviews, only: [:index,:new,:create]
    resources :favorites, only: [:create,:destroy]
  end

end
