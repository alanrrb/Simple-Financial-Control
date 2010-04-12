require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SaldoController, "Saldo de contas" do
  it "Deveria ser capaz de mostrar o saldo atual de uma conta" do
    Conta.stubs(:find_by_id).with('1').returns(Conta.new)
    get :index, :id => 1
    response.should render_template :index
  end
  
  it "" do
    Conta.stubs(:find_by_id).with('1').returns(Conta.new)
    get :index, :id => 1, :ano => 2010, :mes => 3, :dia =>3
    response.should render_template :index
  end
  
end
