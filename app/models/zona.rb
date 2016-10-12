class Zona < ActiveRecord::Base
  belongs_to :grupo

  validates :nombre, :presence => { :message => "Debe completar el campo Nombre" }
end
