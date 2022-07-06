Rails.application.routes.draw do
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'sign_in', to: 'sessions#new', as: 'sign_in'
  get 'signout', to: 'sessions#destroy', as: 'signout'


  resources :sessions, only: [:create, :destroy]

   root to: 'posts#index'
end
