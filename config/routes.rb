require 'api_constraints'
Rails.application.routes.draw do

 

  get 'welcome/index'

  devise_for :users

  resources :users, only: [:show]
  resources :charges, only: [:new, :create]
  resources :activities, only: [:index]

  namespace :api do
    namespace :v1 do
      resources :people, only: [:index]
      resources :companies, only: [:index]
      resources :products, only: [:index]
    end
  end


  root to: "welcome#index"
end
