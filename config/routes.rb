Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :books
  root 'homes#index'
  get '/' => 'homes#index'
  get 'home/about' => 'homes#about', as: :about_homes
end
