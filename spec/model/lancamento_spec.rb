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
    lancamento = lancamento_valido_credito.merge(:credito_debito => nil)
    @lancamento = Lancamento.create(lancamento)
    @lancamento.should_not be_valid
  end
  
  it "deveria validar a ausencia de conta" do
    lancamento = lancamento_valido_credito
    lancamento[:conta]= nil
    @lancamento = Lancamento.create(lancamento)
    @lancamento.should_not be_valid
  end
  
  it "deveria descrever credito_debito 'c' como 'crédito' e 'd' como 'débito'" do
    lancamento = lancamento_valido_credito
    @lancamento = Lancamento.create(lancamento)
    @lancamento.credito_debito_desc.should == 'crédito'
    
    lancamento = lancamento_valido_debito
    @lancamento = Lancamento.create(lancamento)
    @lancamento.credito_debito_desc.should == 'débito'
  end
end