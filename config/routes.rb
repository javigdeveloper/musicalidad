Rails.application.routes.draw do
  devise_for :users
  get "/", to: "students#index"
  resources :students
  resources :teachers  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
