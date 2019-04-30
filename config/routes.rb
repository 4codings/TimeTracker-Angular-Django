Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :stops, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:show, :create]
  end

  namespace :api do
    namespace :v1 do
      resources :stops, only: [:show] do
        resources :reviews, only: [:show, :create]
      end
    end
  end

end
