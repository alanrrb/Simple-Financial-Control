class CreateLancamentos < ActiveRecord::Migration
  def self.up
    create_table :lancamentos do |t|
      t.float :valor
      t.date :data
      t.text :descricao
      t.integer :tipo_lancamento_id
      t.integer :conta_id
      t.string :credito_debito

      t.timestamps
    end
  end

  def self.down
    drop_table :lancamentos
  end
end
