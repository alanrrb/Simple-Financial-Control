require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Conta do
  fixtures :contas, :tipo_contas
  
  before(:each) do
    @atributos_validos = {
      :nome => "Itau",
      :descricao => "conta corrente do itau",
      :valor_inicial => 1000,
      :tipo_conta => TipoConta.create(:nome => "conta corrente")
    }
  end
  
  it "deveria ser valido" do
    @conta = contas(:conta_valida)
    @conta.should be_valid
  end
  
  it "deveria validar a ausencia de nome" do
    @atributos_validos[:nome] = nil
    @conta = Conta.create(@atributos_validos)
    @conta.should_not be_valid
  end
  
  it "deveria validar a ausencia do valor inicial" do
    @atributos_validos[:valor_inicial] = nil
    @conta = Conta.create(@atributos_validos)
    @conta.should_not be_valid
  end
  
  it "deveria validar a ausencia do tipo conta" do
    @atributos_validos[:tipo_conta] = nil
    @conta = Conta.create(@atributos_validos)
    @conta.should_not be_valid
  end
  
  it "deveria ter um valor inicial numerico" do
    @conta = contas(:conta_sem_valor_inicial)
    @conta.should_not be_valid
  end
  
  it "deveria ter o saldo atual com a soma do valor inicial e dos lancamentos" do
    @conta = contas(:conta_valida)
    @conta.tipo_conta = tipo_contas(:conta_corrente)
    tipo_lancamento = TipoLancamento.create(:nome => "salario")
    @conta.lancamentos << Lancamento.new(:valor=>200, :data=>(Date.today - 1), :tipo_lancamento=>tipo_lancamento, :credito_debito=> "c")
    @conta.lancamentos << Lancamento.new(:valor=>50, :data=>(Date.today -1), :tipo_lancamento=>tipo_lancamento, :credito_debito=> "d")
    @conta.saldo.should == 1150
  end
  
  after(:all) do
    Conta.destroy_all
    TipoConta.destroy_all
  end
end