Rails.application.routes.draw do
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  get '/cart' => 'orders#show'

  resources :products
  resources :order_items
  resources :reviews
  resources :comments
  root "products#index"
end
