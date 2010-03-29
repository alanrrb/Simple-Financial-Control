class TipoConta < ActiveRecord::Base
  has_many :contas
  
  validates_uniqueness_of :nome
  validates_presence_of :nome
end
