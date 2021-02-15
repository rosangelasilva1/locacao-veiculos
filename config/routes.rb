Rails.application.routes.draw do
  get 'login/sigin'
  get 'login/cadastrar' , to:'login#cadastrar'
  get '/login' , to:'login#login'
  post '/logar',to: 'login#logar'
  get '/logout' , to:'login#logout'
  get '/loja/index', to:'loja#index'
  get '/loja/locacao/:id', to:'loja#aluguel'
  get '/confirmacao_pagamento/:id', to:'loja#confirmacao_pagamento'
  resources :usuarios, except:[:show]
  get '/administrador/login', to:'login_administrador#login'
  post '/administrador/logar', to:'login_administrador#logar'  
  get '/administrador/logout', to:'login_administrador#logout'
  resources :administradors
  resources :reservas, only: [:index, :show,]
  resources :clientes
  root "loja#index"
  resources :veiculos
  resources :marcas
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
