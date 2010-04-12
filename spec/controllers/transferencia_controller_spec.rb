require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TransferenciaController, "Transferencias" do
  it "Deveria possibilitar a transferencia entre contas" do
    Conta.stubs(:find).returns(Conta.new)
    get :index, :conta_de => 1, :conta_para => 2
    response.should render_template "index"
  end
  
  it "Deveria transferir valores entre contas" do
    TipoLancamento.stubs(:find_by_nome).returns(TipoLancamento.new(:id => 1))
    Lancamento.stubs(:create!).returns(true)
    get :confirmar, :conta_para => 2, :conta_de => 1, :valor => 1000, :descricao => "qualquer"
    redirect_to :controller => "contas", :action => "index"
  end
end