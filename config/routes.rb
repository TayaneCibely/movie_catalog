# config/routes.rb
Rails.application.routes.draw do
  devise_for :users

  root 'movies#index'

  resources :movies do
    resources :comments, only: [:create]
  end

  get "up" => "rails/health#show", as: :rails_health_check
end