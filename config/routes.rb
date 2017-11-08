Rails.application.routes.draw do
  root "static_pages#home"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :posts,			only: [:show, :create, :destroy]
  # resources :posts do
  	resources :comments,	only: [:create, :destroy]
  # end	
  resources :relationships,       only: [:create, :destroy]

end
