Rails.application.routes.draw do
  devise_for :users
  root to: 'top#index'
  resources :health_check, only: [:index]



end
