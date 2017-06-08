class Rutum < ActiveRecord::Base
  belongs_to :zona

  has_many :ruta_usuarios, :foreign_key => 'rutum_id', :class_name => 'RutaUsuario'
  has_many :usuarios, :through => :ruta_usuarios

  has_many :ruta_users, :foreign_key => 'rutum_id', :class_name => 'RutaUser'
  has_many :users, :through => :ruta_users

  accepts_nested_attributes_for :ruta_usuarios, allow_destroy: true

  validates :numero, :presence => { :message => "Debe completar el campo Número" }
  validates :numero, numericality: { only_integer: true, :message => "El campo Número debe ser un valor entero"}
  validates :nombre, :presence => { :message => "Debe completar el campo Nombre" }
  validates :descripcion, :presence => { :message => "Debe completar el campo Descripción" }

  def to_s
  	"Ruta N° #{self.numero} - #{self.nombre}, Zona: #{self.zona}"
  end

  #Devuelve la ultima fecha de medicion de una ruta, util para poder obtener la ruta del próximo período
  def ultima_medicion
    ruta = Usuario.select("usuarios.id as id,
          usuarios.latitud as latitud,
          usuarios.longitud as longitud,
          usuarios.numero as numero,
          usuarios.domicilio_servicio as domicilio_postal, 
          categoria.codigo as categoria, 
          medidors.numero as numero_medidor,
          medidors.multiplicador as multiplicador,
          ruta.zona_id as zona_id,
          medidors.tipo_medidor_id as tipo_medidor_id").joins(:rutum, :categorium, :medidors).where(ruta: {id: self.id}).merge(
          Medidor.select("
            medidors.id as id_medidor,  
            estado_medidors.id as id_estado_medidor,
            estado_medidors.estado_anterior as estado_anterior,
            estado_medidors.fecha_medicion as fecha_medicion").joins(:estado_medidors)
        ).order("estado_medidors.fecha_medicion DESC")
    
    ruta.first.fecha_medicion
  end
end
