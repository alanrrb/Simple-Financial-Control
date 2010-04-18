class SaldoController < ApplicationController
  layout "sfc"
  
  def index    
    @conta = Conta.find_by_id(params[:id])
    @data_saldo = data_saldo
    respond_to do |format|
      format.html 
    end
  end
  
protected
  def data_saldo
    if params[:ano] and params[:mes] and params[:dia]
      Date.new params[:ano].to_i, params[:mes].to_i, params[:dia].to_i
    else
      Date.today
    end
  end
end
