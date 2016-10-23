Rails.application.routes.draw do
  resources :cliques
  devise_for :users
	root 'events#index'
	resources :events
  resources :users
  put '/invite/:id', to: 'events#invite'
end
