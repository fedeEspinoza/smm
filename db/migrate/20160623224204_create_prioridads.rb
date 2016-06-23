class CreatePrioridads < ActiveRecord::Migration
  def change
    create_table :prioridads do |t|
      t.string :descripcion

      t.timestamps null: false
    end
  end
end
