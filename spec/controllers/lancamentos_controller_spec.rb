require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe LancamentosController, "Lancamentos" do
  
  it "Deveria cadastrar um novo lancamentos" do
    Lancamento.any_instance.stubs(:valid?).returns(true)
    post :create
    flash[:notice].should_not be_nil
    response.should redirect_to(lancamentos_path)
  end
  
  it "Deveria rerenderizar a pagina de nova Lancamento em caso de falha" do
    Lancamento.any_instance.stubs(:valid?).returns(false)
    post :create
    flash[:notice].should be_nil
    response.should render_template "new"
  end
  
  it "Deveria se capaz de renderizar a pagina de nova Lancamento" do
    get :new
    response.should render_template("new.html.erb")
  end
  
  it "Deveria ser capaz de mostrar as Lancamentos" do
    get :index
    response.should render_template("index.html.erb")
  end
  
  it "Deveria ser capaz de mostrar os detalhes de uma Lancamento" do
    Lancamento.stubs(:find).returns(Lancamento.new)
    get :show
    response.should render_template("show.js.rjs")
  end
  
  it "Deveria possibilitar a exclusão uma Lancamento" do
    Lancamento.expects(:find).with('1').returns(Lancamento.new)
    Lancamento.any_instance.stubs(:destroy).returns(true)
    delete :destroy, :id => 1
    response.should redirect_to(lancamentos_path)
  end
  
  it "Deveria possibilitar atualizar os dados de uma Lancamento" do
    lancamento = Lancamento.new(:id => 1)
    Lancamento.any_instance.stubs(:valid?).returns(true)
    Lancamento.any_instance.stubs(:update_attributes).returns(true)
    Lancamento.expects(:find).with('1').returns(lancamento)
    put :update, :id => 1
    flash[:notice].should_not be_nil
    response.should redirect_to(lancamentos_path)
  end
  
  it "Deveria rerenderizar a pagina de edicao caso os dados de lancamentos estejam invalidos" do
    lancamento = Lancamento.new(:id => 1)
    Lancamento.any_instance.stubs(:update_attributes).returns(false)
    Lancamento.expects(:find).with('1').returns(lancamento)
    put :update, :id => 1
    flash[:notice].should be_nil
    response.should render_template "edit"
  end
  
  it "Deveria possibilitar a edicao de uma Lancamento" do
    Lancamento.stubs(:find).returns(Lancamento.new)
    get :edit, :id => 1
    response.should render_template("edit.html.erb") 
  end
end