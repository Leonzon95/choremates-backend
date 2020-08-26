Rails.application.routes.draw do
  resources :houses, only: [:create, :update, :destroy, :show] do 
    resources :house_members, only: [:create, :update, :destroy]
    resources :rules, only: [:create, :update, :destroy]
    resources :chores, only: [:create, :update, :destroy]
  end

  
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
