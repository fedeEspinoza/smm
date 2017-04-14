class AgregarCamposAPrioridad < ActiveRecord::Migration
  def change
  	add_column :prioridads, :valor, :integer
  end
end
