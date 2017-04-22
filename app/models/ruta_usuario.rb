class RutaUsuario < ActiveRecord::Base
  belongs_to :rutum, :foreign_key => 'rutum_id', :class_name => 'Rutum'
  belongs_to :usuario, :foreign_key => 'usuario_id', :class_name => 'Usuario'
end
