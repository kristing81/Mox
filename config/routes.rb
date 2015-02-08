require 'api_constraints'
Rails.application.routes.draw do

  get 'welcome/index'

  devise_for :users

  resources :users, only: [:show]

  namespace :api do
    namespace :v1 do
      resources :people, only: [:index]
    end
  end
  # namespace :api,  defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/' do
  #   scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true)  do
  #     resources :users, :only => [:show, :create, :update, :destroy]
  #   end      
  # end

  root to: "welcome#index"
end
