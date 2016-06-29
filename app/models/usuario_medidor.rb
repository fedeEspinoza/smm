class UsuarioMedidor < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :medidor
end
