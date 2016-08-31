class Persona < ActiveRecord::Base
  belongs_to :tipo_documento

  def to_s
  	"#{self.nro_documento} - #{apellido}, #{nombre}"
  end
end
