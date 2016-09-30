class Persona < ActiveRecord::Base
  belongs_to :tipo_documento
  has_many :usuarios

  validates :nro_documento, presence: true
  validates :nro_documento, numericality: { only_integer: true }
  validates :nro_documento, length: {minimum: 7, maximum: 8}
  validates :apellido, presence: true
  validates :nombre, presence: true
  validates :telefono, presence: true
  validates :email, presence: true

  def to_s
  	"#{self.nro_documento} - #{apellido}, #{nombre}"
  end
end
