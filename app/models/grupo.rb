class Grupo < ActiveRecord::Base

	validates :nombre, :presence => { :message => "Debe completar el campo Nombre" }
	validates :descripcion, :presence => { :message => "Debe completar el campo Descripción" }
	validates :codigo, :presence => { :message => "Debe completar el campo Código" }

	def to_s
		"#{self.nombre} - #{self.descripcion}"
	end
end
