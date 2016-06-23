class CreateZonas < ActiveRecord::Migration
  def change
    create_table :zonas do |t|
      t.string :nombre
      t.references :grupo, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
