Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :stops, only: [:index, :show]

  namespace :api do
    namespace :v1 do
      resources :stops, only: [:show]
    end
  end
end
