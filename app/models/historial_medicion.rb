class HistorialMedicion < ActiveRecord::Base
  belongs_to :novedad
  belongs_to :medidor
  belongs_to :user

  validates :estado_medidor, :presence => { :message => "Debe completar el campo Estado medidor" }
  validates :fecha_medicion, :presence => { :message => "Debe completar el campo Fecha de medición" }
end
