class CreateMedidorEstadoMedidors < ActiveRecord::Migration
  def change
    create_table :medidor_estado_medidors do |t|
      t.references :medidor, index: true, foreign_key: true
      t.references :estado_medidor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
