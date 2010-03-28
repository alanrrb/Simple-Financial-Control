def lancamento_valido_credito
  {
    :data => Date.today,
    :descricao => "deposito salario",
    :valor => 1000,
    :credito_debito => "c",
    :tipo_lancamento => TipoLancamento.new(:nome => "salario"),
    :conta => Conta.new(conta_valida)
  }
end

def lancamento_valido_debito
  {
    :data => Date.today,
    :descricao => "deposito salario",
    :valor => 1000,
    :credito_debito => "d",
    :tipo_lancamento => TipoLancamento.new(:nome => "salario"),
    :conta => Conta.new(conta_valida)
  }
end
