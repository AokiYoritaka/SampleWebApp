Rails.application.routes.draw do
  root 'static_pages#home'
  get "start", to: "static_pages#start"
  get 'likes/create'
  get 'likes/destroy'
  get 'reviews/index'

  #devise 
  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks",
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources :schools do
    resources :reviews do
      resources :comments
    end
  end

  resources :likes, only: [:destroy, :create]  
  resources :profiles, only: [:show, :edit, :update]
  resources :notifications
  resources :categories, only: [:index, :show, :new, :create, :destroy]
  get "search", to: 'reviews#search'
  get "alltags", to: "static_pages#alltags"
end
