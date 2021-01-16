Rails.application.routes.draw do
  get 'homes/about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  resources :books, only: [:new, :create, :index, :show, :destroy]
  resources :users, only: [:show, :index, :edit]
end
