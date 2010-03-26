class TransferenciaController < ApplicationController
  def index
	  @conta_de   = Conta.find(params[:conta_de])
	  @conta_para = Conta.find(params[:conta_para])
	
	  respond_to do |format|
      format.html
    end
  end
  
  def confirmar
    tipo_lancamento = TipoLancamento.find_by_nome("transferencia")
    dados_lancamento = {
    :valor				=> params[:valor], 
    :data 				=> Date.today, 
    :descricao 			=> params[:descricao], 
    :tipo_lancamento_id => tipo_lancamento.id, 
    :conta_id 			=> params[:conta_de], 
    :credito_debito 	=> 'd' }

    #de
    Lancamento.create! dados_lancamento

    #para
    dados_lancamento[:conta_id] 		= params[:conta_para]
    dados_lancamento[:credito_debito] 	= 'c'
    Lancamento.create! dados_lancamento

    redirect_to(:controller => "contas", :action => "index")
  end
  
end
