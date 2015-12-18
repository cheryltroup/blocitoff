Rails.application.routes.draw do
  
  devise_for :users
   resources :users, only: [:show] do
   resources :items
  end

  get 'items/show'
  get 'users/show'
  get 'items/create'
  get 'home/about'
  root to: 'home#index'

end
