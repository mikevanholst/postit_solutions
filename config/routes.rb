PostitTemplate::Application.routes.draw do
  

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

    
  resources :categories, has_many: :votes
  resources :posts, except: [:destroy] do
    resources :comments, only: [:new, :create]
  end
  resources :users, only: [:show, :edit, :create, :update]

  root to: 'posts#index'

  get '/posts/:id', to: 'posts#show'

end