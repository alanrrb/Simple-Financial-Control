class Conta < ActiveRecord::Base
  belongs_to :tipo_conta
  has_many :lancamentos
end
