def conta_valida
  {
    :nome => "Itau",
    :descricao => "conta corrente do itau",
    :valor_inicial => 1000,
    :tipo_conta => TipoConta.create(:nome => "conta corrente")
  }
end