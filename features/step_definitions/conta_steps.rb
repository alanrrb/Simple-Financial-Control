Given /^tenho que cadastrar uma conta$/ do
  @conta = Conta.create!
end

When /^eu entro com o nome e a descricao da conta e o tipo de conta$/ do
  @conta.update_attribute(:nome, "conta corrente Itau")
  @conta.update_attribute(:descricao, "conta corrente no itau, agencia 3784 - c/c 29798-2")
  @conta.update_attribute(:tipo_conta, 
  TipoConta.create!(:nome=> "conta corrente", :descricao => "conta corrente bancaria"))
end

Then /^eu deveria ter a conta persistida no SFC$/ do
  conta_reloaded = Conta.find_by_nome("conta corrente Itau")
  tipo_conta_reloaded = TipoConta.find_by_nome("conta corrente")
  @conta.tipo_conta == tipo_conta_reloaded
  @conta.should == conta_reloaded
end
