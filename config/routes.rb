Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :stops, only: [:index, :show, :new, :create]

  get 'admin/reviews', to: 'admin#reviews'
  delete 'admin/review', to: 'admin#delete_review'

  namespace :api do
    namespace :v1 do
      resources :stops, only: [:show]
    end
  end
end
