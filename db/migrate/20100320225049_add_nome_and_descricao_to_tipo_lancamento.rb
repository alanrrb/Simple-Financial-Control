class AddNomeAndDescricaoToTipoLancamento < ActiveRecord::Migration
  def self.up
    add_column :tipo_lancamentos, :nome, :string
    add_column :tipo_lancamentos, :descricao, :text
  end

  def self.down
    remove_column :tipo_lancamentos, :descricao
    remove_column :tipo_lancamentos, :nome
  end
end
