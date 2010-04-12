require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ContasController, "Contas" do
  
  it "Deveria cadastrar uma nova conta" do
    Conta.any_instance.stubs(:valid?).returns(true)
    post :create
    flash[:notice].should_not be_nil
    response.should redirect_to(contas_path)
  end
  
  it "Deveria rerenderizar a pagina de nova conta em caso de falha" do
    Conta.any_instance.stubs(:valid?).returns(false)
    post :create
    flash[:notice].should be_nil
    response.should render_template "new"
  end
  
  it "Deveria se capaz de renderizar a pagina de nova conta" do
    get :new
    response.should render_template("new.html.erb")
  end
  
  it "Deveria ser capaz de mostrar as contas" do
    get :index
    response.should render_template("index.html.erb")
  end
  
  it "Deveria ser capaz de mostrar os detalhes de uma conta" do
    Conta.stubs(:find).returns(Conta.new)
    get :show
    response.should render_template("show.html.erb")
  end
  
  it "Deveria ser capaz de mostrar lancamentos de conta" do
    Conta.expects(:find).with('1').returns(Conta.new)
    get :lancamentos, :id => 1
    response.should render_template("lancamentos.js.rjs")
  end
  
  it "Deveria ser capaz de mostrar lancamentos de conta apartir de uma data" do
    Conta.expects(:find).with('1').returns(Conta.new)
    Conta.any_instance.stubs(:lancamentos).returns(Lancamento.new)
    get :lancamentos, :id => 1, :ano => 2010, :mes => 3, :dia => 25
    response.should render_template("lancamentos.js.rjs")
  end
  
  it "Deveria possibilitar a exclusão uma conta" do
    Conta.expects(:find).with('1').returns(Conta.new)
    Conta.any_instance.stubs(:destroy).returns(true)
    delete :destroy, :id => 1
    response.should redirect_to(contas_path)
  end
  
  it "Deveria possibilitar atualizar os dados de uma conta" do
    conta = Conta.new(:id => 1)
    Conta.any_instance.stubs(:valid?).returns(true)
    Conta.any_instance.stubs(:update_attributes).returns(true)
    Conta.expects(:find).with('1').returns(conta)
    put :update, :id => 1
    flash[:notice].should_not be_nil
    response.should redirect_to(contas_path)
  end
  
  it "Deveria rerenderizar a pagina de edicao caso os dados da conta estejam invalidos" do
    conta = Conta.new(:id => 1)
    Conta.any_instance.stubs(:update_attributes).returns(false)
    Conta.expects(:find).with('1').returns(conta)
    put :update, :id => 1
    flash[:notice].should be_nil
    response.should render_template "edit"
  end
  
  it "Deveria possibilitar a edicao de uma conta" do
    Conta.stubs(:find).returns(Conta.new)
    get :edit, :id => 1
    response.should render_template("edit.html.erb") 
  end
end