class Categorium < ApplicationRecord

	validates :codigo, :presence => { :message => "Debe completar el campo Código" }
	validates :descripcion, :presence => { :message => "Debe completar el campo Descripción" }

	def to_s
  		"#{self.codigo} - #{self.descripcion}"
  	end 
end
