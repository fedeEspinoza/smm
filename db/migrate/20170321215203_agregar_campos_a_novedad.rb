class AgregarCamposANovedad < ActiveRecord::Migration
  def change
  	add_column :novedads, :codigo_servicio, :string
  end
end
