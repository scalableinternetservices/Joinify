Rails.application.routes.draw do

	root 'events#index'
	resources :events
  	
  	#Users
  	resources :users
  	devise_for :users
end
