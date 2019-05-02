Rails.application.routes.draw do
  root 'stops#index'
  devise_for :users

  resources :stops, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:show, :create]
  end

  get 'admin/reviews', to: 'admin#reviews'
  post 'admin/review/:id', to: 'admin#delete_review'

  namespace :api do
    namespace :v1 do
      resources :votes, only: [:create, :show]
      resources :stops, only: [:show] do
        resources :reviews, only: [:show, :create]
      end
    end
  end
end
