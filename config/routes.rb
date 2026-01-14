Rails.application.routes.draw do
  post '/login', to: 'auth#login'
  post '/register', to: 'users#create'
  resources :messages, only: [:create]
end
