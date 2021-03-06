class ContasController < ApplicationController
  layout "sfc"
  
  # GET /contas
  # GET /contas.xml
  def index
    @contas = Conta.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contas }
    end
  end

  # GET /contas/1
  # GET /contas/1.xml
  def show
    @conta = Conta.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @conta }
    end
  end

  # GET /contas/new
  # GET /contas/new.xml
  def new
    @conta = Conta.new
    @tipo_contas = TipoConta.find(:all)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @conta }
    end
  end

  # GET /contas/1/edit
  def edit
    @tipo_contas = TipoConta.find(:all)
    @conta = Conta.find(params[:id])
  end

  # POST /contas
  # POST /contas.xml
  def create
    @conta = Conta.new(params[:conta])

    respond_to do |format|
      if @conta.save
        flash[:notice] = "Conta #{@conta.nome} foi criado com sucesso!"
        format.html { redirect_to(contas_path) }
        format.xml  { render :xml => @conta, :status => :created, :location => @conta }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @conta.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contas/1
  # PUT /contas/1.xml
  def update
    @conta = Conta.find(params[:id])

    respond_to do |format|
      if @conta.update_attributes(params[:conta])
        flash[:notice] = "Conta #{@conta.nome} foi atualizado com sucesso!"
        format.html { redirect_to(@conta) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @conta.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contas/1
  # DELETE /contas/1.xml
  def destroy
    @conta = Conta.find(params[:id])
    @conta.destroy

    respond_to do |format|
      format.html { redirect_to(contas_url) }
      format.xml  { head :ok }
    end
  end
  
  def lancamentos
    @conta = Conta.find(params[:id])
    if params[:ano] and params[:mes] and params[:dia]
	  @lancamentos = @conta.lancamentos.find(
        :all, 
        :conditions => ["data = ?", Date.new(params[:ano].to_i, params[:mes].to_i, params[:dia].to_i)]
      )
    else
      @lancamentos = @conta.lancamentos
    end
    respond_to do |format|
      format.js
      format.html
    end
    
  end
end
