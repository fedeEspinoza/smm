class CreateEstadoMedidors < ActiveRecord::Migration
  def change
    create_table :estado_medidors do |t|
      t.references :novedad, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :estado_actual
      t.integer :estado_anterior
      t.integer :promedio
      t.integer :demanda
      t.string :observacion
      t.datetime :fecha_medicion
      t.datetime :fecha_modificacion

      t.timestamps null: false
    end
  end
end
