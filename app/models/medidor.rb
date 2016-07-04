class Medidor < ActiveRecord::Base
  belongs_to :tipo_medidor

  def to_s
  	"#{self.numero} - #{self.multiplicador} - #{self.tipo_medidor}"
  end 
end
