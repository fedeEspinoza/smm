class Novedad < ActiveRecord::Base
  belongs_to :prioridad

  validates :codigo, presence: true
  validates :descripcion, presence: true

  def to_s 
  	self.descripcion	
  end
end
