class EstadoMedidor < ActiveRecord::Base
  belongs_to :novedad
  belongs_to :user

  has_many :medidor_estado_medidors, :foreign_key => 'estado_medidor_id', :class_name => 'MedidorEstadoMedidor'
  has_many :medidors, :through => :medidor_estado_medidors

  validates :estado_actual, :presence => { :message => "Debe completar el campo Estado actual" }
  validates :estado_actual, numericality: { only_integer: true, :message => "El campo Estado actual debe ser un valor entero"}
end
