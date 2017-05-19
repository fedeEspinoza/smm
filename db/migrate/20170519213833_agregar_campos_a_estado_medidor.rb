class AgregarCamposAEstadoMedidor < ActiveRecord::Migration
  def change
  	add_column :estado_medidors, :periodo, :string  	
  end
end
