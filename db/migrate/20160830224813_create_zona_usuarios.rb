class CreateZonaUsuarios < ActiveRecord::Migration
  def change
    create_table :zona_usuarios do |t|
      t.references :zona, index: true, foreign_key: true
      t.references :usuario, index: true, foreign_key: true
      t.integer :orden

      t.timestamps null: false
    end
  end
end
