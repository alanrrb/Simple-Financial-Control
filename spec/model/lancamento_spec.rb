require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Lancamento do
  
  it "deveria ser valido" do
    @lancamento = Lancamento.create(lancamento_valido_credito)
    @lancamento.should be_valid
  end
  
  it "deveria validar a ausencia de valor" do
    lancamento = lancamento_valido_credito
    lancamento[:valor]= nil
    @lancamento = Lancamento.create(lancamento)
    @lancamento.should_not be_valid
  end
  
  it "deveria validar a ausencia de data" do
    lancamento = lancamento_valido_credito
    lancamento[:data]= nil
    @lancamento = Lancamento.create(lancamento)
    @lancamento.should_not be_valid
  end
  
  it "deveria validar a ausencia de tipo lancamento" do
    lancamento = lancamento_valido_credito
    lancamento[:tipo_lancamento]= nil
    @lancamento = Lancamento.create(lancamento)
    @lancamento.should_not be_valid
  end
  
  it "deveria validar a ausencia da origem do lancamento (credito/debito)" do
    lancamento = lancamento_valido_credito
    lancamento[:credito_debito]= nil
    @lancamento = Lancamento.create(lancamento)
    @lancamento.should_not be_valid
  end
  
  it "deveria validar a ausencia de conta" do
    lancamento = lancamento_valido_credito
    lancamento[:conta]= nil
    @lancamento = Lancamento.create(lancamento)
    @lancamento.should_not be_valid
  end
end