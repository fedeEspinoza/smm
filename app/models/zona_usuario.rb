class ZonaUsuario < ActiveRecord::Base
  belongs_to :zona, :foreign_key => 'zona_id', :class_name => 'Zona'
  belongs_to :usuario, :foreign_key => 'usuario_id', :class_name => 'Usuario'
end
