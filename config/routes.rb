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
  resources :posts,			only: [:show, :create, :destroy, :index]
  # resources :posts do
  resources :comments,	only: [:create, :destroy]
  # end	

  resources :posts do
    member do
      resources :likes, only: [:create, :destroy]
    end
  end
  resources :relationships,       only: [:create, :destroy]
  get 'tags/:tag', to: 'posts#index', as: :tag
  get "posts/:search", to: "posts#index", as: :search

end
