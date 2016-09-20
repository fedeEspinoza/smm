class Categorium < ActiveRecord::Base

	validates :codigo, presence: true
	validates :descripcion, presence: true

	def to_s
  		"#{self.codigo} - #{self.descripcion}"
  	end 
end
