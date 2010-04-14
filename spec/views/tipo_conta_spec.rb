require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Tipo de contas" do
  before(:all) do
    visit("/tipo_contas")
  end
  
  after(:all) do 
    TipoConta.destroy_all
  end
  
  it "deveria ser capaz de visualizar tipos de contas" do
    page.should have_content("Listando os tipos de conta")
  end
  
  it "deveria ter a possibilidade de cadastrar um tipo de conta" do
    click_link("Novo tipo de conta")
  end
  
  it "deveria ser capaz de cadastrar um tipo de conta" do
    nome_tipo_conta = "Conta Corrente"
    descricao_tipo_conta = "uma conta corrente de teste"
    
    fill_in "tipo_conta_nome", :with => nome_tipo_conta
    fill_in "tipo_conta_descricao", :with => descricao_tipo_conta
    click "tipo_conta_submit"
    page.should have_content(nome_tipo_conta)
    page.should have_content(descricao_tipo_conta)
    page.should_not have_content("error")
  end
  
  it "deveria apos cadastrar um novo tipo conta, mostra-la na lista de tipo de contas" do
    page.should have_content("Conta Corrente")
  end
  
  it "deveria ser capaz de editar uma conta corrente" do
    
  end
end