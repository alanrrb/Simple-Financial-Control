require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TipoLancamentosController, "Tipo de lancamentos" do
  
  it "Deveria cadastrar um novo tipo_lancamentos" do
    TipoLancamento.any_instance.stubs(:valid?).returns(true)
    post :create
    flash[:notice].should_not be_nil
    response.should redirect_to(tipo_lancamentos_path)
  end
  
  it "Deveria rerenderizar a pagina de nova TipoLancamento em caso de falha" do
    TipoLancamento.any_instance.stubs(:valid?).returns(false)
    post :create
    flash[:notice].should be_nil
    response.should render_template "new"
  end
  
  it "Deveria se capaz de renderizar a pagina de nova TipoLancamento" do
    get :new
    response.should render_template("new.html.erb")
  end
  
  it "Deveria ser capaz de mostrar as TipoLancamentos" do
    get :index
    response.should render_template("index.html.erb")
  end
  
  it "Deveria ser capaz de mostrar os detalhes de uma TipoLancamento" do
    TipoLancamento.stubs(:find).returns(TipoLancamento.new)
    get :show
    response.should render_template("show.html.erb")
  end
  
  it "Deveria possibilitar a exclusão uma TipoLancamento" do
    TipoLancamento.expects(:find).with('1').returns(TipoLancamento.new)
    TipoLancamento.any_instance.stubs(:destroy).returns(true)
    delete :destroy, :id => 1
    response.should redirect_to(tipo_lancamentos_path)
  end
  
  it "Deveria possibilitar atualizar os dados de uma TipoLancamento" do
    tipo_lancamento = TipoLancamento.new(:id => 1)
    TipoLancamento.any_instance.stubs(:valid?).returns(true)
    TipoLancamento.any_instance.stubs(:update_attributes).returns(true)
    TipoLancamento.expects(:find).with('1').returns(tipo_lancamento)
    put :update, :id => 1
    flash[:notice].should_not be_nil
    response.should redirect_to(tipo_lancamentos_path)
  end
  
  it "Deveria rerenderizar a pagina de edicao caso os dados de tipo contas estejam invalidos" do
    tipo_conta = TipoLancamento.new(:id => 1)
    TipoLancamento.any_instance.stubs(:update_attributes).returns(false)
    TipoLancamento.expects(:find).with('1').returns(tipo_conta)
    put :update, :id => 1
    flash[:notice].should be_nil
    response.should render_template "edit"
  end
  
  it "Deveria possibilitar a edicao de um tipo de conta" do
    TipoLancamento.stubs(:find).returns(TipoLancamento.new)
    get :edit, :id => 1
    response.should render_template("edit.html.erb") 
  end
end