class SaldoController < ApplicationController
  def atual
    #Lancamento.find_by_conta_id_and_data_and_credito_debito(
    #:conta_id => params[:id], :data => Date.new, :credito_debito => "c")
    hoje = DateTime.now
    credito = Lancamento.sum :valor, :conditions => {:conta_id => params[:id], :data => Date.new(hoje.year, hoje.month, hoje.day), :credito_debito => 'c'}
    debito  = Lancamento.sum :valor, :conditions => {:conta_id => params[:id], :data => Date.new(hoje.year, hoje.month, hoje.day), :credito_debito => 'd'}
    
    @saldo = credito - debito
    @conta = Conta.find_by_id(params[:id])
    
    respond_to do |format|
      format.html 
    end
    
  end

end
