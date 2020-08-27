Rails.application.routes.draw do
  devise_for :users
  root to: 'top#index'
  resources :health_check, only: [:index]

  #devise
  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks",
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

end
