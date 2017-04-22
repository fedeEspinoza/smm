class CreateRuta < ActiveRecord::Migration
  def change
    create_table :ruta do |t|
      t.integer :numero
      t.string :nombre
      t.references :zona, index: true, foreign_key: true
      t.string :descripcion

      t.timestamps null: false
    end
  end
end
