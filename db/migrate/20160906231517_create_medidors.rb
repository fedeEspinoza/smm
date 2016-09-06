class CreateMedidors < ActiveRecord::Migration
  def change
    create_table :medidors do |t|
      t.integer :numero
      t.integer :multiplicador
      t.string :marca
      t.string :modelo
      t.datetime :fecha_alta
      t.datetime :fecha_baja
      t.references :tipo_medidor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
