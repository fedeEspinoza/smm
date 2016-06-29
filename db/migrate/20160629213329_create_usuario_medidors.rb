class CreateUsuarioMedidors < ActiveRecord::Migration
  def change
    create_table :usuario_medidors do |t|
      t.references :usuario, index: true, foreign_key: true
      t.references :medidor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
