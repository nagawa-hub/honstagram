Rails.application.routes.draw do
  devise_for :users
  root to: "books#top"
  
  resources :users, only: [:show,:edit,:update]
  resources :books, only: [:index,:new,:create,:show] do
    collection do
      get 'top'
    end
    resources :reviews, only: [:new,:create]
  end

end
