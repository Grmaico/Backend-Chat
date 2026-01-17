Rails.application.routes.draw do
  post '/login', to: 'auth#login'
  post '/register', to: 'users#create'
  get 'messages/:user_id', to: 'messages#index'
  post '/messages', to: 'messages#create'
  get '/metrics', to: 'metrics#index'
end
