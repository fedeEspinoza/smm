class Novedad < ActiveRecord::Base
  belongs_to :prioridad

  validates :codigo, :presence => { :message => "Debe completar el campo Código" }
  validates :descripcion, :presence => { :message => "Debe completar el campo Descripción" }

  def to_s 
  	self.descripcion	
  end
end
