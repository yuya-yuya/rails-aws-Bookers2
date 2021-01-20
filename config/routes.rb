Rails.application.routes.draw do
  get 'home/about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#top'
  resources :books, only: [:new, :create, :index, :show, :destroy]
  resources :users, only: [:show, :index, :edit, :update]
end
