class AddTipoContaIdToConta < ActiveRecord::Migration
  def self.up
    add_column :contas, :tipo_conta_id, :integer
  end

  def self.down
    remove_column :contas, :tipo_conta_id
  end
end
