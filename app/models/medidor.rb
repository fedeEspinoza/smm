class Medidor < ActiveRecord::Base
  belongs_to :tipo_medidor

  has_many :usuario_medidors, :foreign_key => 'medidor_id', :class_name => 'UsuarioMedidor'
  has_many :usuarios, :through => :usuario_medidors

  has_many :historial_medicions, :foreign_key => 'medidor_id', :class_name => 'HistorialMedicion'
  has_many :historial_medicions, :through => :historial_medicions

  validates :numero, :presence => { :message => "Debe completar el campo Número" }
  validates :numero, length: {minimum: 1, maximum: 8, :message => "El campo Número puede tener hasta 8 dígitos"}
  validates :multiplicador, :presence => { :message => "Debe completar el campo Multiplicador" }
  validates :multiplicador, length: {minimum: 1, maximum: 3, :message => "El campo Multiplicador puede tener hasta 3 dígitos"}
  validates :marca, :presence => { :message => "Debe completar el campo Marca" }
  validates :modelo, :presence => { :message => "Debe completar el campo Modelo" }

  def to_s
	"#{self.numero} - #{self.marca} - #{self.modelo}, (#{self.tipo_medidor})"
  end 
end
