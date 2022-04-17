class TipoMedidor < ApplicationRecord
	validates :nombre, :presence => { :message => "Debe completar el campo Nombre" }
	validates :codigo, :presence => { :message => "Debe completar el campo Código" }
  	validates :codigo, numericality: { only_integer: true, :message => "El campo Código debe ser un valor entero"}
  	validates :descripcion, :presence => { :message => "Debe completar el campo Descripción" }

	def to_s
		self.nombre
	end
end
