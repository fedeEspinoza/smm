class CreateHistorialMedicions < ActiveRecord::Migration
  def change
    create_table :historial_medicions do |t|
      t.references :novedad, index: true, foreign_key: true
      t.references :medidor, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :estado_medidor
      t.datetime :fecha_medicion
      t.datetime :fecha_modificacion

      t.timestamps null: false
    end
  end
end
