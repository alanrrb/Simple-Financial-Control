class CreateTipoContas < ActiveRecord::Migration
  def self.up
    create_table :tipo_contas do |t|
      t.string :nome
      t.text :descricao

      t.timestamps
    end
  end

  def self.down
    drop_table :tipo_contas
  end
end
