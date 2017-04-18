class AgregarCamposAUser < ActiveRecord::Migration
  def change
  	add_column :users, :empleado_id, :integer
    add_foreign_key :users, :empleados
  end
end
