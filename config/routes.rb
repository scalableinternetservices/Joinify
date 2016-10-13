Rails.application.routes.draw do
  resources :users
  root 'greetings#hello_world'
end
