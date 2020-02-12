Rails.application.routes.draw do
  devise_for :users

  root to: "students#index"
  resources :students
  resources :teachers
  resources :subjects do 
    resources :student_subjects
  end
   
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end