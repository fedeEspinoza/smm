class Rutum < ActiveRecord::Base
  belongs_to :zona

  has_many :ruta_usuarios, :foreign_key => 'rutum_id', :class_name => 'RutaUsuario'
  has_many :usuarios, :through => :ruta_usuarios

  accepts_nested_attributes_for :ruta_usuarios, allow_destroy: true

end
