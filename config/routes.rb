Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  get 'hello/index' => 'hello#index'
  root 'hello#index'
  
  resources :comments
  get 'users' => 'users#index' 


  
  
end
