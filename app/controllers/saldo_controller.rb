class SaldoController < ApplicationController
  def atual
    criterios = "conta_id = ? AND data <= ? AND credito_debito = ?"
    
    credito = Lancamento.sum :valor, :conditions => 
    [criterios, params[:id], data_saldo, 'c']
    
    debito  = Lancamento.sum :valor, :conditions => 
      [criterios, params[:id], data_saldo, 'd']
    
    @conta = Conta.find_by_id(params[:id])
    @saldo = @conta.valor_inicial + (credito - debito)
    
    respond_to do |format|
      format.html 
    end
  end
  
private
  def data_saldo
    if params[:ano] and params[:mes] and params[:dia]
      ano, mes, dia = params[:ano].to_i, params[:mes].to_i, params[:dia].to_i
      data_saldo = Date.new ano, mes, dia
    else
      aux = DateTime.now
      data_saldo =  Date.new(aux.year, aux.month, aux.day)
    end
  end
end
