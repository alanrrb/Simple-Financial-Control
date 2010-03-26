class Lancamento < ActiveRecord::Base
  belongs_to :tipo_lancamento
  belongs_to :conta
  
  def credito_debito_desc
    if credito_debito == 'c'
      'crédito'
    else
      'débito'
    end
  end
end
