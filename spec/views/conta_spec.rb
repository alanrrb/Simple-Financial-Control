require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Cadastro de contas" do
  
  before(:all) do
    TipoConta.create! :nome => "Conta Corrente", :descricao => "uma conta corrente"
    visit("/contas")
  end
  
  after(:all) do 
    Conta.destroy_all
    TipoConta.destroy_all
  end
  
  it "deveria ser capaz de listar as contas, mas não ter nenhuma conta cadastrada" do
    page.should have_no_content("Qualquer")
  end

  it "deveria possibilitar o cadastro de uma nova conta" do
    click_link("Nova conta")
  end

  it "deveria ser capaz de apos inserir os dados de uma nova conta, cadastra-la" do
    fill_in "conta_nome", :with => "Qualquer"
    fill_in "conta_descricao", :with => "uma conta corrente"
    locate("//select[@id='conta_tipo_conta_id']").select("Conta Corrente")
    fill_in "conta_valor_inicial", :with => "1000"
    click "conta_submit"
  end

  it "deveria ser capaz de listar as contas e mostrar a conta previamente cadastrada" do
    page.should have_content("Qualquer")
	page.should have_content("uma conta corrente")
	page.should have_content("1000")
  end

end