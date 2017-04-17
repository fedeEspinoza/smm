class AgregarCamposANovedad < ActiveRecord::Migration
  def change
  	add_column :novedads, :codigo_servicio, :string
  	add_column :novedads, :repite_estado, :boolean
  end
end
