Rails.application.routes.draw do
  root 'courses#index'
  
  resources :course_faculties
  resources :courses
  resources :semesters
  resources :professors
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
