require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Conta do
  
  before(:each) do
    @atributos_validos = {
      :nome => "Itau",
      :descricao => "conta corrente do itau",
      :valor_inicial => 1000,
      :tipo_conta => TipoConta.create(:nome => "conta corrente")
    }
  end
  
  it "deveria ser valido" do
    @conta = Conta.create(@atributos_validos)
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
    @atributos_validos[:valor_inicial] = "valor"
    @conta = Conta.create(@atributos_validos)
    @conta.should_not be_valid
  end
  
  it "deveria ter o saldo atual com a soma do valor inicial e dos lancamentos" do
    @conta = Conta.create(@atributos_validos)
    tipo_lancamento = TipoLancamento.create(:nome => "salario")
    @conta.lancamentos << Lancamento.new(:valor=>200, :data=>Date.today, :tipo_lancamento=>tipo_lancamento, :credito_debito=> "c")
    @conta.lancamentos << Lancamento.new(:valor=>50, :data=>Date.today, :tipo_lancamento=>tipo_lancamento, :credito_debito=> "d")
    @conta.saldo.should == 1150
  end
end