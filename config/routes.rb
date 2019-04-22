Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :stops, only: [:index, :show]
end
