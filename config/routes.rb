# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/new'

  get 'users/create'

  devise_for :users
  # get 'posts'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  resources :posts, :users do
    resources :comments
  end
  post 'post/:id/likes', to: 'posts#like', as: :likes
  post 'user/:id/addfriend', to: 'users#addfriend', as: :follows
  post 'post/:id/unlikes', to: 'posts#unlike', as: :unlikes
  post 'post/:id/feed_unlikes', to: 'posts#feed_unlike', as: :feed_unlikes
  post 'post/:id/feed_likes', to: 'posts#feed_like', as: :feed_likes

  get 'feed', to: 'posts#feed', as: :news
end
