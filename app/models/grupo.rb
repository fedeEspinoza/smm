class Grupo < ActiveRecord::Base

	validates :nombre, presence: true
	validates :descripcion, presence: true
	validates :codigo, presence: true

	def to_s
		"#{self.nombre} - #{self.descripcion}"
	end
end
