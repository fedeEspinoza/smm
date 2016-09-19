class UsuarioMedidor < ActiveRecord::Base
  belongs_to :usuario, :foreign_key => 'usuario_id', :class_name => 'Usuario'
  belongs_to :medidor, :foreign_key => 'medidor_id', :class_name => 'Medidor'
end
