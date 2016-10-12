class Persona < ActiveRecord::Base
  belongs_to :tipo_documento
  has_many :usuarios

  validates :nro_documento, :presence => { :message => "Debe completar el campo Número de documento" }
  validates :nro_documento, numericality: { only_integer: true, :message => "El campo Número de documento debe ser un valor entero"}
  validates :nro_documento, length: {minimum: 7, maximum: 8, :message => "El campo Número de documento debe tener 7 u 8 dígitos"}
  validates :apellido, :presence => { :message => "Debe completar el campo Apellido" }
  #validates :apellido, :format => {:with => /\A[a-zA-Z]+\z/, :message => "El campo Apellido sólo debe contener letras" }
  validates :nombre, :presence => { :message => "Debe completar el campo Nombre" }
  #validates :nombre, :format => {:with => /\A[a-zA-Z]+\z/, :message => "El campo Nombre sólo debe contener letras" }
  validates :telefono, :presence => { :message => "Debe completar el campo Teléfono" }
  validates :telefono, numericality: { only_integer: true, :message => "El campo Teléfono debe ser un valor entero"}
  validates :email, :presence => { :message => "Debe completar el campo Email" }
  validates :email, :format => {:with => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, :message => "El campo Email debe contener una dirección de correo válida"}

  def to_s
  	"#{self.tipo_documento} #{self.nro_documento} - #{apellido}, #{nombre}"
  end
end
