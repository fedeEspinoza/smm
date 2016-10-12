class Persona < ActiveRecord::Base
  belongs_to :tipo_documento
  has_many :usuarios

  validates :nro_documento, :presence => { :message => "Debe completar el campo N° de documento" }
  validates :nro_documento, numericality: { only_integer: true }
  validates :nro_documento, length: {minimum: 7, maximum: 8}
  validates :apellido, :presence => { :message => "Debe completar el campo Apellido" }
  validates :nombre, :presence => { :message => "Debe completar el campo Nombre" }
  validates :telefono, :presence => { :message => "Debe completar el campo Teléfono" }
  validates :email, :presence => { :message => "Debe completar el campo Email" }

  def to_s
  	"#{self.tipo_documento} #{self.nro_documento} - #{apellido}, #{nombre}"
  end
end
