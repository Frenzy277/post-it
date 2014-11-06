PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  get '/registration', to: 'users#new', as: :register

  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :posts, except: [:destroy] do
    resources :comments, only: [:create]
  end
  resources :categories, only: [:new, :create, :show]
  resources :users, only: [:create, :edit, :update]

end
