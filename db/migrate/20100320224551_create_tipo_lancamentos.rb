class CreateTipoLancamentos < ActiveRecord::Migration
  def self.up
    create_table :tipo_lancamentos do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :tipo_lancamentos
  end
end
