# frozen_string_literal: true

Rails.application.routes.draw do
  resources :classrooms
  devise_for :users
  get "homepage/index"
  resources :announcements
  resources :subjects
  resources :homes

  get "classrooms/:id/courses", to: "classrooms#classroom_course"
  get "classrooms/:id/students", to: "classrooms#classroom_students"
  # Defines the root path route ("/")
  root "homepage#index"
end
