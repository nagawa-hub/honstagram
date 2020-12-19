Rails.application.routes.draw do
  devise_for :users
  root to: "books#top"
  
  resources :users, only: [:show,:edit,:update] do
    resources :favorites, only: [:index]
  end
  resources :relationships, only: [:create, :destroy]
  resources :books, only: [:index,:new,:create,:show,:edit,:update] do
    collection do
      get :top,:search
    end
    resources :reviews, only: [:new,:create]
    resources :favorites, only: [:create,:destroy]
  end

end
