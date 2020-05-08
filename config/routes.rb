Rails.application.routes.draw do
  devise_for :users
  resources :users do
  	resource :relationships, only: [:create, :destroy]
  end
  get 'users/:id/follows' => 'users#follows', as: 'user_follows'
  get 'users/:id/followers' => 'users#followers', as: 'user_followers'
  resources :books
  root 'homes#index'
  get '/' => 'homes#index'
  get 'home/about' => 'homes#about', as: :about_homes
end
