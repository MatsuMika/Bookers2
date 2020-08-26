Rails.application.routes.draw do
resources :blogs
  devise_for :users

root to: 'books#top'
resources :books, :except => :new

end
