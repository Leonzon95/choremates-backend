Rails.application.routes.draw do
  resources :rules
  resources :days
  resources :chores
  resources :house_members
  resources :houses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
