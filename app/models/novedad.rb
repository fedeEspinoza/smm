class Novedad < ApplicationRecord
  belongs_to :prioridad

  validates :codigo, presence: { message: "Debe completar el campo Código" }
  validates :codigo, length: {minimum: 1, maximum: 2, message: "El campo Código debe tener 2 dígitos"}
  validates :descripcion, presence: { message: "Debe completar el campo Descripción" }
  validates :codigo_servicio, presence: { message: "Debe completar el campo Código de servicio" }

  def to_s 
  	"#{self.codigo} - #{self.descripcion}"	
  end
end
