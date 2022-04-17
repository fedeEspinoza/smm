class Grupo < ApplicationRecord

	validates :nombre, :presence => { :message => "Debe completar el campo Nombre" }
	validates :descripcion, :presence => { :message => "Debe completar el campo Descripción" }
	validates :codigo, :presence => { :message => "Debe completar el campo Código" }
	validates :codigo, length: {minimum: 1, maximum: 1, :message => "El campo Código debe tener 1 dígito"}

	def to_s
		"#{self.nombre} - #{self.descripcion}"
	end
end
