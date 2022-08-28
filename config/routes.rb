# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get "homepage/index"
  resources :announcements
  resources :subjects
  resources :homes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "homepage#index"
end
