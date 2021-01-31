Rails.application.routes.draw do
  resources :requests, only: [:destroy] do 
    patch 'create', to: 'requests#create', on: :member
    patch 'accept', on: :member
  end
  
  devise_for :users, :controllers => { :users => "users" }
  resources :users, only: [:show, :edit, :update]

  resources :teams do 
    patch 'kick', on: :member
  end


  root "teams#index"
end
