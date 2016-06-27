class CreatePersonas < ActiveRecord::Migration
  def change
    create_table :personas do |t|
      t.references :tipo_documento, index: true, foreign_key: true
      t.integer :nro_documento
      t.string :apellido
      t.string :nombre
      t.string :telefono
      t.string :email

      t.timestamps null: false
    end
  end
end
