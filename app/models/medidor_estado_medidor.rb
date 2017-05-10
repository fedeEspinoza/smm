class MedidorEstadoMedidor < ActiveRecord::Base
  belongs_to :medidor
  belongs_to :estado_medidor
end
