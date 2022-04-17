class TipoDocumento < ApplicationRecord
	
	validates :descripcion, :presence => { :message => "Debe completar el campo Descripción" }

	def to_s
		self.descripcion
	end
end
