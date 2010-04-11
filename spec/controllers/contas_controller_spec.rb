require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ContasController, "POST Create" do
  
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
  
  it "Deveria ser capaz de executar transferencia entre contas" 
  
  it "Deveria possibilitar a exclução uma conta" 
  
  it "Deveria possibilitar a edicao de uma conta" do
    Conta.stubs(:find).returns(Conta.new)
    get :edit, :id => 1
    response.should render_template("edit.html.erb") 
  end
end