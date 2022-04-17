class MedidorEstadoMedidor < ApplicationRecord
  belongs_to :medidor, :foreign_key => 'medidor_id', :class_name => 'Medidor'
  belongs_to :estado_medidor, :foreign_key => 'estado_medidor_id', :class_name => 'EstadoMedidor'
end
