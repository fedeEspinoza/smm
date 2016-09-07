class Medidor < ActiveRecord::Base
  belongs_to :tipo_medidor

  def to_s
	"#{self.numero} - #{self.marca} - #{self.modelo}, (#{self.tipo_medidor.to_s})"
  end 
end
