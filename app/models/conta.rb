class Conta < ActiveRecord::Base
  belongs_to :tipo_conta
  has_many :lancamentos
  CRITERIOS_TOTAL_LANCAMENTOS = "data <= ? AND credito_debito = ?"

  def saldo data_saldo = Date.today
    credito = lancamentos.sum :valor, :conditions => 
    [CRITERIOS_TOTAL_LANCAMENTOS, data_saldo, 'c']
    
    debito  = lancamentos.sum :valor, :conditions => 
    [CRITERIOS_TOTAL_LANCAMENTOS, data_saldo, 'd']
    
    valor_inicial + (credito - debito)
  end
end
