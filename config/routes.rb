Rails.application.routes.draw do
  root 'courses#index'
  
  resources :courses do
    collection do
      get 'edit_multiple'
      post 'update_multiple'
    end
    member do
      get 'get_professors'
      get 'add_professor'
    end
  end
  
  resources :course_faculties
  resources :semesters
  resources :professors
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
