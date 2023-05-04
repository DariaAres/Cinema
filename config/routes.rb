# frozen_string_literal: true

Rails.application.routes.draw do
  scope :api do
    scope :v1 do
      resources :users, only: %i(index show update destroy) do 
        post 'sign_in', to: 'authentification#sign_in', on: :collection
        post 'sign_up', to: 'registration#sign_up', on: :collection
      end
      
      resources :countries
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
