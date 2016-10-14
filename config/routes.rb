Rails.application.routes.draw do
  resources :events
  root 'greetings#hello_world'
end
