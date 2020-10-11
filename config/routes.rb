  Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  get 'reviews/index'
  get "start", to: "static_pages#start"
  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks",
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  get "alltags", to: "static_pages#alltags"
  get "search", to: "reviews#search"
  root 'static_pages#home'

  resources :schools do
    collection do   
      get :search
    end
    resources :reviews do
      resources :comments
    end
  end
  resources :likes, only: [:destroy, :create]  
  resources :notifications, only: :index
  resources :categories, only: [:index, :show, :new, :create, :destroy]
  resources :profiles, only: [:show, :edit, :update]
end
