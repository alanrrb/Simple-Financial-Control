class Lancamento < ActiveRecord::Base
  belongs_to :tipo_lancamento
  belongs_to :conta
  
  validates_presence_of :valor, :data, :tipo_lancamento, :credito_debito, :conta
  
  def credito_debito_desc
    if credito_debito == 'c'
      'crédito'
    else
      'débito'
    end
  end
end
