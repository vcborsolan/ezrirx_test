Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, param: :username
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'appllication#not_found'
  resources :seller_product
  get '/', to: 'buyer#index'
  get '/products', to: 'product#index'
end
