Rails.application.routes.draw do
  get 'home/about'
  devise_for :users, controllers: {  
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :books, only: [:new, :create, :index, :show, :destroy,:edit,:update]
  resources :users, only: [:show, :index, :edit, :update]
  root to: 'home#top'
end
