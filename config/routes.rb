PostitTemplate::Application.routes.draw do
  

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'


    
  resources :categories
  resources :posts, except: [:destroy] do
    member do
      post 'vote'
    end

    resources :comments, only: [:new, :create] do
      member do
       post 'vote'
      end
    end
  end

  resources :users, only: [:show, :edit, :create, :update]

  root to: 'posts#index'

  get '/posts/:id', to: 'posts#show'

end