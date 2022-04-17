class Prioridad < ApplicationRecord

	validates :descripcion, :presence => { :message => "Debe completar el campo Descripción" }
	validates :valor, :presence => { :message => "Debe completar el campo Valor" }

	def to_s 
		self.descripcion
	end
end
