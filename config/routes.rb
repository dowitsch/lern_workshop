Rails.application.routes.draw do
  resources :users
  get '/logins', to: 'logins#index'
  get '/posts', to: 'posts#index'
  post '/logins', to: 'logins#login_attempt'
  post 'logins/logout', to: 'logins#destroy', as: 'logout'
  resources :chat_rooms, only: [:new, :create, :show, :index]
  root 'chat_rooms#index'

  mount ActionCable.server => '/cable'
end
