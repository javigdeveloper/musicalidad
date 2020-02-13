Rails.application.routes.draw do
  devise_for :users

  root to: "students#index"
  resources :students do
    resources :student_subjects
  end
  resources :teachers
  resources :subjects do
    resources :student_subjects
    delete "/delete_by_student/:student_id", to: "student_subjects#destroy"
  end
   
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end