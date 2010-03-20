class TipoLancamentosController < ApplicationController
  # GET /tipo_lancamentos
  # GET /tipo_lancamentos.xml
  def index
    @tipo_lancamentos = TipoLancamento.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tipo_lancamentos }
    end
  end

  # GET /tipo_lancamentos/1
  # GET /tipo_lancamentos/1.xml
  def show
    @tipo_lancamento = TipoLancamento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tipo_lancamento }
    end
  end

  # GET /tipo_lancamentos/new
  # GET /tipo_lancamentos/new.xml
  def new
    @tipo_lancamento = TipoLancamento.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tipo_lancamento }
    end
  end

  # GET /tipo_lancamentos/1/edit
  def edit
    @tipo_lancamento = TipoLancamento.find(params[:id])
  end

  # POST /tipo_lancamentos
  # POST /tipo_lancamentos.xml
  def create
    @tipo_lancamento = TipoLancamento.new(params[:tipo_lancamento])

    respond_to do |format|
      if @tipo_lancamento.save
        flash[:notice] = 'TipoLancamento was successfully created.'
        format.html { redirect_to(@tipo_lancamento) }
        format.xml  { render :xml => @tipo_lancamento, :status => :created, :location => @tipo_lancamento }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tipo_lancamento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tipo_lancamentos/1
  # PUT /tipo_lancamentos/1.xml
  def update
    @tipo_lancamento = TipoLancamento.find(params[:id])

    respond_to do |format|
      if @tipo_lancamento.update_attributes(params[:tipo_lancamento])
        flash[:notice] = 'TipoLancamento was successfully updated.'
        format.html { redirect_to(@tipo_lancamento) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tipo_lancamento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_lancamentos/1
  # DELETE /tipo_lancamentos/1.xml
  def destroy
    @tipo_lancamento = TipoLancamento.find(params[:id])
    @tipo_lancamento.destroy

    respond_to do |format|
      format.html { redirect_to(tipo_lancamentos_url) }
      format.xml  { head :ok }
    end
  end
end
