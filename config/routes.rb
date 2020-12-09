Rails.application.routes.draw do
  devise_for :users
  root to: "books#index"
  
  resources :users, only: [:show,:edit,:update]
  resources :books, only: [:index,:new,:create]

end
