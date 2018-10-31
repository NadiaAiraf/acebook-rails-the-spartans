# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # get 'posts'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  post 'post/:id/likes', to: 'posts#like', as: :likes
  post 'post/:id/unlikes', to: 'posts#unlike', as: :unlikes
  resources :posts, :users
end
