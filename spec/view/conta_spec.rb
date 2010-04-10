require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Cadastro de contas" do
  
  before do
    visit("http://localhost:3000/contas")
  end
  
  
  it "deveria ser capaz de listar as contas, mas não ter nenhuma conta cadastrada" do
    page.should have_no_content("Qualquer")
  end

  it "deveria possibilitar o cadastro de uma nova conta" do
    click_link("Nova conta")
  end

  it "deveria ser capaz de apos inserir os dados de uma nova conta, cadastra-la" do
    click_link("Nova conta")
    fill_in "conta_nome", :with => "Qualquer"
    fill_in "conta_descricao", :with => "Qualquer"
    locate("//select[@id='conta_tipo_conta_id']").select("Conta Corrente")
    fill_in "conta_valor_inicial", :with => "1000"
    click "conta_submit"
  end

  it "deveria ser capaz de listar as contas e mostrar a conta previamente cadastrada" do
    page.should have_content("Qualquer")
  end

end