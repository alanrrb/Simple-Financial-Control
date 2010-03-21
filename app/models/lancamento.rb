class Lancamento < ActiveRecord::Base
  belongs_to :tipo_lancamento
  belongs_to :conta
end
