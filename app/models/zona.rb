class Zona < ActiveRecord::Base
  belongs_to :grupo

  has_many :zona_usuarios, :foreign_key => 'zona_id', :class_name => 'ZonaUsuario'
  has_many :usuarios, :through => :zona_usuarios

  validates :nombre, :presence => { :message => "Debe completar el campo Nombre" }

  def to_s
  	"#{self.nombre} - #{self.grupo}"
  end
end
