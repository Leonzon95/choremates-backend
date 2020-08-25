Rails.application.routes.draw do
  resources :houses, only: [:create, :update, :delete, :show]
  resources :rules
  resources :chores
  resources :house_members
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
