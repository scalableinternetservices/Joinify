Rails.application.routes.draw do
  devise_for :users
	root 'events#index'
	resources :events
  resources :users
  put '/invite/:id', to: 'events#invite'
end
