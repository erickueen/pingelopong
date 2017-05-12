Rails.application.routes.draw do
  get 'ranks/new'

  get 'ranks/update'

  get 'ranks/index'

  get 'ranks/create'

  resources :games, only: [:index, :new, :create]
  devise_for :users
  root to: "ranks#index"
  get '/history', to: 'games#index'
  get '/log',     to: 'games#new'
end
