Rails.application.routes.draw do
	root 'greetings#hello_world'
	resources :events
  resources :users
end
