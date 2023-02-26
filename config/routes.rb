Rails.application.routes.draw do
  root 'message_groups#index'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  resources :message_groups
  resources :users

  resources :message_groups do
    resources :messages
  end  
end
