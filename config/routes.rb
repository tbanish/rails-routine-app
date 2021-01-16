Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  resources :notes
  resources :items
  resources :instruments
  resources :routines
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
