class CreateRutaUsers < ActiveRecord::Migration
  def change
    create_table :ruta_users do |t|
      t.references :rutum, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.datetime :fecha_alta
      t.datetime :fecha_baja

      t.timestamps null: false
    end
  end
end
