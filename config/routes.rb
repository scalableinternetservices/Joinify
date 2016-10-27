Rails.application.routes.draw do
  get 'comments/new'

  get 'comments/index'

  get 'comments/show'

  get 'comments/destroy'

  get 'comments/update'

  get 'comments/edit'

  resources :cliques
  devise_for :users
	root 'events#index'
	resources :events
  resources :users
  put '/invite/:id', to: 'events#invite'
  put '/accept/:id', to: 'users#accept'
  get '/accept/:id', to: 'users#show'
  post "/events/:id", to: "comments#create"
end
