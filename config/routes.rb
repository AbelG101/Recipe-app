# frozen_string_literal: true

Rails.application.routes.draw do
  get '/public_recipes', to: 'recipes#public_recipes'
  get 'about/index'
  get '/general_shopping_list/:id', to: 'shopping_list#index', as: 'general_shopping_list'
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root :to => 'recipes#public_recipes', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'recipes#public_recipes'
    end
  end
  resources :foods
  resources :recipes do
    resources :recipe_foods
    collection do 
      get 'public_recipes', to: 'recipes#public_recipes'
    end
  end
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
