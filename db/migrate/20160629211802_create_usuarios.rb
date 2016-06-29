class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.references :categorium, index: true, foreign_key: true
      t.integer :numero
      t.string :razon_social
      t.string :domicilio
      t.integer :circunscripcion
      t.integer :sector
      t.integer :tipo
      t.integer :manzana
      t.integer :parcela
      t.integer :unidad_funcional
      t.string :latitud
      t.string :longitud
      t.references :estado, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
