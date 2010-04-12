class TipoContasController < ApplicationController
  # GET /tipo_contas
  # GET /tipo_contas.xml
  def index
    @tipo_contas = TipoConta.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tipo_contas }
    end
  end

  # GET /tipo_contas/1
  # GET /tipo_contas/1.xml
  def show
    @tipo_conta = TipoConta.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tipo_conta }
    end
  end

  # GET /tipo_contas/new
  # GET /tipo_contas/new.xml
  def new
    @tipo_conta = TipoConta.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tipo_conta }
    end
  end

  # GET /tipo_contas/1/edit
  def edit
    @tipo_conta = TipoConta.find(params[:id])
  end

  # POST /tipo_contas
  # POST /tipo_contas.xml
  def create
    @tipo_conta = TipoConta.new(params[:tipo_conta])

    respond_to do |format|
      if @tipo_conta.save
        flash[:notice] = 'TipoConta was successfully created.'
        format.html { redirect_to(tipo_contas_path) }
        format.xml  { render :xml => @tipo_conta, :status => :created, :location => @tipo_conta }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tipo_conta.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tipo_contas/1
  # PUT /tipo_contas/1.xml
  def update
    @tipo_conta = TipoConta.find(params[:id])

    respond_to do |format|
      if @tipo_conta.update_attributes(params[:tipo_conta])
        flash[:notice] = 'TipoConta was successfully updated.'
        format.html { redirect_to(@tipo_conta) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tipo_conta.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_contas/1
  # DELETE /tipo_contas/1.xml
  def destroy
    @tipo_conta = TipoConta.find(params[:id])
    @tipo_conta.destroy

    respond_to do |format|
      format.html { redirect_to(tipo_contas_url) }
      format.xml  { head :ok }
    end
  end
end
