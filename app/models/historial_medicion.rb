class HistorialMedicion < ActiveRecord::Base
  belongs_to :novedad,  :foreign_key => 'novedad_id', :class_name => 'Novedad'
  belongs_to :medidor, :foreign_key => 'medidor_id', :class_name => 'Medidor'
  belongs_to :user, :foreign_key => 'user_id', :class_name => 'User'

  validates :estado_medidor, :presence => { :message => "Debe completar el campo Estado medidor" }
  validates :fecha_medicion, :presence => { :message => "Debe completar el campo Fecha de medición" }
end
