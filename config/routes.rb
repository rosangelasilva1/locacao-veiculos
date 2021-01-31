Rails.application.routes.draw do
  get '/administrador/login', to:'login_administrador#login'
  post '/administrador/logar', to:'login_administrador#logar'  
  get '/administrador/logout', to:'login_administrador#logout'
  resources :administradors
  resources :reservas
  resources :clientes
  root "veiculos#index"
  resources :veiculos
  resources :marcas
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
