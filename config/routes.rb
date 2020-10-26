# For details on the DSL available within this file,
# see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :posts, only: [:create, :index]
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index], on: :member, module: :users
  end
end
