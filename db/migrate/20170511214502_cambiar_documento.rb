class CambiarDocumento < ActiveRecord::Migration
  def up
  	change_column :personas, :nro_documento, :bigint
  	change_column :empleados, :nro_documento, :bigint
  end
end
