# frozen_string_literal: true

Rails.application.routes.draw do
  defaults format: :json do
     resources :comments, except: %i[new edit], param: :id
     resources :courses, except: %i[new edit], param: :id
     resources :students, except: %i[new edit], param: :id
     resources :classrooms, except: %i[new edit], param: :id
     resources :announcements, except: %i[new edit], param: :id
     resources :subjects, except: %i[new edit], param: :id
     resources :users, only: %i[index create]
     resource :session, only: [:create, :destroy]
   end
  resources :homes

  get "classrooms/:id/courses", to: "classrooms#classroom_course"
  get "classrooms/:id/students", to: "classrooms#classroom_students"
  # Defines the root path route ("/")
  root "homepage#index"
end
