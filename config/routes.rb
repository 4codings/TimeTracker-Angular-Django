Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :stops, only: [:index, :show] do
    resources :reviews, only: [:new, :create]
  end

  namespace :api do
    namespace :v1 do
      resources :stops, only: [:show] do
        resources :reviews, only: [:show]
      end 
    end
  end
end
