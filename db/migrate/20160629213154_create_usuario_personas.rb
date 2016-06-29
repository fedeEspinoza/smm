class CreateUsuarioPersonas < ActiveRecord::Migration
  def change
    create_table :usuario_personas do |t|
      t.references :usuario, index: true, foreign_key: true
      t.references :persona, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
