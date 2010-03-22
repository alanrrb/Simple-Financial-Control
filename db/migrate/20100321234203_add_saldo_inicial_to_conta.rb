class AddSaldoInicialToConta < ActiveRecord::Migration
  def self.up
    add_column :contas, :valor_inicial, :float
  end

  def self.down
    remove_column :contas, :valor_inicial
  end
end
