class CreateNovedads < ActiveRecord::Migration
  def change
    create_table :novedads do |t|
      t.integer :codigo
      t.string :descripcion
      t.references :prioridad, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
