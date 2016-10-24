class TipoDocumento < ActiveRecord::Base
	
	validates :descripcion, :presence => { :message => "Debe completar el campo Descripción" }

	def to_s
		self.descripcion
	end
end
