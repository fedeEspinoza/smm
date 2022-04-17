class Zona < ApplicationRecord
  belongs_to :grupo

  validates :nombre, :presence => { :message => "Debe completar el campo Nombre" }

  def to_s
  	"#{self.nombre} - #{self.grupo}"
  end
end
