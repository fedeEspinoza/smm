class CreateEmpleados < ActiveRecord::Migration
  def change
    create_table :empleados do |t|
      t.integer :nro_legajo
      t.references :tipo_documento, index: true, foreign_key: true
      t.integer :nro_documento
      t.string :apellido
      t.string :nombre
      t.references :estado, index: true, foreign_key: true
      t.datetime :fecha_alta
      t.datetime :fecha_baja

      t.timestamps null: false
    end
  end
end
