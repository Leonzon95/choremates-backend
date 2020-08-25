Rails.application.routes.draw do
  resources :houses, only: [:create, :update, :delete, :show] do 
    resources :house_members, only: [:create, :update, :delete]
  end
  resources :rules
  resources :chores
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
