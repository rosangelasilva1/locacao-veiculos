Rails.application.routes.draw do
  resources :administradors
  resources :reservas
  resources :clientes
  root "veiculos#index"
  resources :veiculos
  resources :marcas
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
