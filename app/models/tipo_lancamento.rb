class TipoLancamento < ActiveRecord::Base
  has_many :lancamento
  
  validates_uniqueness_of :nome
  validates_presence_of :nome
end
