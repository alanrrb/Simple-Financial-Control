require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TipoContasController, "Tipo de contas" do
  
  it "Deveria cadastrar um novo tipo_contas" do
    TipoConta.any_instance.stubs(:valid?).returns(true)
    post :create
    flash[:notice].should_not be_nil
    response.should redirect_to(tipo_contas_path)
  end
  
  it "Deveria rerenderizar a pagina de nova TipoConta em caso de falha" do
    TipoConta.any_instance.stubs(:valid?).returns(false)
    post :create
    flash[:notice].should be_nil
    response.should render_template "new"
  end
  
  it "Deveria se capaz de renderizar a pagina de nova TipoConta" do
    get :new
    response.should render_template("new.html.erb")
  end
  
  it "Deveria ser capaz de mostrar as TipoContas" do
    get :index
    response.should render_template("index.html.erb")
  end
  
  it "Deveria ser capaz de mostrar os detalhes de uma TipoConta" do
    TipoConta.stubs(:find).returns(TipoConta.new)
    get :show
    response.should render_template("show.html.erb")
  end
  
  it "Deveria possibilitar a exclusão uma TipoConta" do
    TipoConta.expects(:find).with('1').returns(TipoConta.new)
    TipoConta.any_instance.stubs(:destroy).returns(true)
    delete :destroy, :id => 1
    response.should redirect_to(tipo_contas_path)
  end
  
  it "Deveria possibilitar atualizar os dados de uma TipoConta" do
    tipo_conta = TipoConta.new(:id => 1)
    TipoConta.any_instance.stubs(:valid?).returns(true)
    TipoConta.any_instance.stubs(:update_attributes).returns(true)
    TipoConta.expects(:find).with('1').returns(tipo_conta)
    put :update, :id => 1
    flash[:notice].should_not be_nil
    response.should redirect_to(tipo_contas_path)
  end
  
  it "Deveria rerenderizar a pagina de edicao caso os dados de tipo contas estejam invalidos" do
    tipo_conta = TipoConta.new(:id => 1)
    TipoConta.any_instance.stubs(:update_attributes).returns(false)
    TipoConta.expects(:find).with('1').returns(tipo_conta)
    put :update, :id => 1
    flash[:notice].should be_nil
    response.should render_template "edit"
  end
  
  it "Deveria possibilitar a edicao de um tipo de conta" do
    TipoConta.stubs(:find).returns(TipoConta.new)
    get :edit, :id => 1
    response.should render_template("edit.html.erb") 
  end
end