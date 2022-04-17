class Empleado < ApplicationRecord
  belongs_to :tipo_documento

  validates :nro_documento, :presence => { :message => "Debe completar el campo Número de documento" }
  validates :nro_documento, numericality: { only_integer: true, :message => "El campo Número de documento debe ser un valor entero"}
  validates :nro_documento, length: {minimum: 7, maximum: 11, :message => "El campo Número de documento debe tener 7 u 11 dígitos"}
  validates :apellido, :presence => { :message => "Debe completar el campo Apellido" }
  validates :apellido, :format => {:with => /\A[a-z ñáéíóúü'A-ZÑÁÉÍÓÚÜ]+\z/, :message => "El campo Apellido sólo debe contener letras" }
  validates :nombre, :presence => { :message => "Debe completar el campo Nombre" }
  validates :nombre, :format => {:with => /\A[a-z ñáéíóúü'A-ZÑÁÉÍÓÚÜ]+\z/, :message => "El campo Nombre sólo debe contener letras" }  

  def to_s
  	"#{self.nro_documento} - #{self.apellido}, #{self.nombre}"  	
  end
end
