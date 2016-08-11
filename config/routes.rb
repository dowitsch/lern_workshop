Rails.application.routes.draw do
  resources :users
  get '/logins', to: 'logins#index'

  resources :chat_rooms, only: [:new, :create, :show, :index]
  root 'chat_rooms#index'
end
