class Usuario < ActiveRecord::Base
  belongs_to :categorium
  belongs_to :estado
  belongs_to :persona

  has_many :usuario_medidors, :foreign_key => 'usuario_id', :class_name => 'UsuarioMedidor'
  has_many :medidors, :through => :usuario_medidors

  accepts_nested_attributes_for :usuario_medidors, allow_destroy: true
  accepts_nested_attributes_for :persona

  validates :numero, presence: true
  #validates :latitud, :presence => { :message => "Debe seleccionar una ubicación en el mapa" }
  #validates :longitud, :presence => { :message => "Debe seleccionar una ubicación en el mapa" }

  def to_s
  	"#{self.persona.to_s} - #{self.razon_social}"
  end
end
