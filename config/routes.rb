Rails.application.routes.draw do
  devise_for :users

  root to: 'books#top'
  get "books/about" => "books#about"
  resources :books

resources :users, only: [:index, :show, :edit, :update]
end
