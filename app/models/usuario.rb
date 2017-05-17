class Usuario < ActiveRecord::Base
  belongs_to :categorium
  belongs_to :estado
  belongs_to :persona

  has_many :usuario_medidors, :foreign_key => 'usuario_id', :class_name => 'UsuarioMedidor'
  has_many :medidors, :through => :usuario_medidors

  has_many :ruta_usuarios, :foreign_key => 'usuario_id', :class_name => 'RutaUsuario'
  has_many :rutum, :through => :ruta_usuarios

  accepts_nested_attributes_for :usuario_medidors, allow_destroy: true
  accepts_nested_attributes_for :persona

  validates :numero, :presence => { :message => "Debe completar el campo Número" }
  validates :numero, numericality: { only_integer: true, :message => "El campo Número debe ser un valor entero"}
  validates :numero, length: {minimum: 6, maximum: 7, :message => "El campo Número debe tener entre 1 y 7 dígitos"}
  validates :latitud, :presence => { :message => "Debe seleccionar una ubicación en el mapa" }
  validate :check_medidores

  #Valido que cada usuario pueda tener sólo un medidor de Energia Electrica
  def check_medidores
    medidores_ids = self.usuario_medidors.map(&:medidor_id)
    aux_hash = Hash[(1..3).collect { |v| [v, 0] }]
    cantidad_por_tipo = Medidor.joins(:tipo_medidor).where(id: medidores_ids).group(:tipo_medidor_id).count
    cantidad_por_tipo = aux_hash.merge(cantidad_por_tipo)
    cant_tipo_2_y_3 = cantidad_por_tipo[2] + cantidad_por_tipo[3]
    if (cantidad_por_tipo[2] >= 2) || (cantidad_por_tipo[3] >= 2 || cant_tipo_2_y_3 >= 2)                
      errors.add(:base,"No puede asignar más de un medidor de energía eléctrica (Activa o Reactiva)")
    end
  end 

  def to_s
  	"#{self.persona} - #{self.razon_social}"
  end

  def data_y_domicilio
    "Usuario N°: #{self.numero} - Domicilio de servicio: #{self.domicilio_servicio}"
  end
end
