class CreateTipoDocumentos < ActiveRecord::Migration
  def change
    create_table :tipo_documentos do |t|
      t.string :descripcion

      t.timestamps null: false
    end
  end
end
