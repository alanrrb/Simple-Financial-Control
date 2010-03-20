Given /^tenho que cadastrar um tipo de conta$/ do
  @tipo_conta = TipoConta.create!
end

When /^eu entro com o nome e a descricao do tipo de conta$/ do
  @tipo_conta.update_attribute(:nome, "conta corrente")
  @tipo_conta.update_attribute(:descricao, "conta corrente bancaria")
end

Then /^eu deveria ter o tipo conta persistida no SFC$/ do
  tipo_conta_reloaded = TipoConta.find_by_nome("conta corrente")
  @tipo_conta.should == tipo_conta_reloaded
end
