Rails.application.routes.draw do
  resources :likes, only: [:destroy, :create]
  
  get 'reviews/index'
  root "top#index"
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
    
  resources :profiles, only: [:show, :edit, :update]
end
