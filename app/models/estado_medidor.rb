class EstadoMedidor < ActiveRecord::Base
  belongs_to :novedad
  belongs_to :user

  has_many :medidor_estado_medidors, :foreign_key => 'estado_medidor_id', :class_name => 'MedidorEstadoMedidor'
  has_many :medidors, :through => :medidor_estado_medidors
end
