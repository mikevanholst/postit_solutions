PostitTemplate::Application.routes.draw do
  
  
    resources :categories
    resources :posts, except: [:destroy] do
    resources :comments, only: [:new, :create]
  end


  root to: 'posts#index'

  get '/posts/:id', to: 'posts#show'

end