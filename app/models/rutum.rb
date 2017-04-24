class Rutum < ActiveRecord::Base
  belongs_to :zona

  has_many :ruta_usuarios, :foreign_key => 'rutum_id', :class_name => 'RutaUsuario'
  has_many :usuarios, :through => :ruta_usuarios

  accepts_nested_attributes_for :ruta_usuarios, allow_destroy: true

  validates :numero, :presence => { :message => "Debe completar el campo Número" }
  validates :numero, numericality: { only_integer: true, :message => "El campo Número debe ser un valor entero"}
  validates :nombre, :presence => { :message => "Debe completar el campo Nombre" }
  validates :descripcion, :presence => { :message => "Debe completar el campo Descripción" }

end
