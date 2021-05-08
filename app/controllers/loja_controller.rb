class LojaController < UsuariosController
  before_action :set_veiculo, only: [:aluguel, :alugar]
  skip_before_action :verify_authenticity_token, only: [:alugar, :aluguel]

  def index
  end
  
  def aluguel

  end

  def alugar
    if params[:dias].present?
      dias = params[:dias].to_i
      @valor_total = dias * @veiculo.valor
      reserva = Reserva.new(reservado_de: Time.now,
                           reservado_ate:Time.now+dias.day,
                           valor_alugado:@valor_total, 
                           status: Reserva::STATUS[:aguardando], 
                           usuario_id:cookies[:usuario] ,
                           veiculo_id: params[:id] 
                           )
      if reserva.save!
        redirect_to "/confirmacao_pagamento/#{reserva.id}"
        return
      end
    end
    redirect_to "loja/locacao/#{@veiculo.id}", notice: 'Houve um erro ao ir para a tela de confirmação'
  end

  def confirmacao_pagamento
    @reserva = Reserva.find(params[:id])
  end
  
  private 
  def set_veiculo
    @veiculo = Veiculo.find(params[:id])
  end 

end
