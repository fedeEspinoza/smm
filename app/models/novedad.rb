class Novedad < ActiveRecord::Base
  belongs_to :prioridad

  def to_s 
  	self.descripcion
  end
end
