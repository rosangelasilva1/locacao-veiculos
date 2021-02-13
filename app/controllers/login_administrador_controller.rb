class LoginAdministradorController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :logar
  layout "login"
  def login
  end

  def logar
    administrador = Administrador.login(params[:login],params[:senha])
    if administrador.present?
      cookies[:administrador] = administrador.nome
      redirect_to '/'
    end
  end

  def logout
    cookies[:administrador] = nil
    redirect_to '/administrador/login'
  end 
end
