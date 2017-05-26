class Medidor < ActiveRecord::Base
  belongs_to :tipo_medidor

  has_many :usuario_medidors, :foreign_key => 'medidor_id', :class_name => 'UsuarioMedidor'
  has_many :usuarios, :through => :usuario_medidors

  has_many :medidor_estado_medidors, :foreign_key => 'medidor_id', :class_name => 'MedidorEstadoMedidor'
  has_many :estado_medidors, :through => :medidor_estado_medidors

  validates :numero, :presence => { :message => "Debe completar el campo Número" }
  validates :numero, length: {minimum: 1, maximum: 8, :message => "El campo Número puede tener hasta 8 dígitos"}
  validates :multiplicador, :presence => { :message => "Debe completar el campo Multiplicador" }
  validates :multiplicador, length: {minimum: 1, maximum: 3, :message => "El campo Multiplicador puede tener hasta 3 dígitos"}
  validates :marca, :presence => { :message => "Debe completar el campo Marca" }
  validates :modelo, :presence => { :message => "Debe completar el campo Modelo" }

  def to_s
	"Medidor N°: #{self.numero} - #{self.marca} - #{self.modelo}, (#{self.tipo_medidor})"
  end 

  #Calcular consumo promedio hasta la fecha
  def consumo_promedio
    estados = self.estado_medidors.where("fecha_medicion <= ?",DateTime.now)
    aux = 0
    estados.each do |estado|
      aux = aux + estado.consumo
    end
    aux / estados.count
  end
end
