class HistorialMedicion < ActiveRecord::Base
  belongs_to :novedad
  belongs_to :medidor
  belongs_to :user
end
