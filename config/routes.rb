# For details on the DSL available within this file,
# see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :posts, only: [:create, :index, :destroy]
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index], on: :member, module: :users
  end
  resources :friendships, only: [:index, :create] do
    delete :destroy, on: :collection
  end
  resources :timeline, only: [:index]
  resources :notifications, only: [:index]
end
