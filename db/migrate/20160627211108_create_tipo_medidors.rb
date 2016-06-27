class CreateTipoMedidors < ActiveRecord::Migration
  def change
    create_table :tipo_medidors do |t|
      t.string :nombre
      t.integer :codigo
      t.string :descripcion

      t.timestamps null: false
    end
  end
end
