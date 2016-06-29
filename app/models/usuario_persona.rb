class UsuarioPersona < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :persona
end
