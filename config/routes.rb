Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :create, :new, :show] 
  end
  
  resources :posts, only: [:index, :create, :new, :show] do
    resources :comments, only: [:create, :new]
    resources :likes, only: [:create]
  end

  get "up" => "rails/health#show", as: :rails_health_check

  root  to: "users#index"
end
