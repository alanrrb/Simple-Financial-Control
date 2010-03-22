class SaldoController < ApplicationController
  def atual
    if params[:ano] and params[:mes] and params[:dia]
      ano, mes, dia = params[:ano].to_i, params[:mes].to_i, params[:dia].to_i
      data_saldo = Date.new ano, mes, dia
    else
      aux = DateTime.now
      data_saldo =  Date.new(aux.year, aux.month, aux.day)
    end
    
    credito = Lancamento.sum :valor, :conditions => 
    ["conta_id = ? AND data <= ? AND credito_debito = ?", 
      params[:id], 
      data_saldo, 
      'c']
    
    debito  = Lancamento.sum :valor, :conditions => 
      ["conta_id = ? AND data <= ? AND credito_debito = ?", 
        params[:id], 
        data_saldo, 
        'd']
    
    @conta = Conta.find_by_id(params[:id])
    @saldo = @conta.valor_inicial + (credito - debito)
    
    respond_to do |format|
      format.html 
    end
  end
  
  def data_saldo params
  
  end
end
