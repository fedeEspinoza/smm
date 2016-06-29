class ZonaUsuario < ActiveRecord::Base
  belongs_to :zona
  belongs_to :usuario
end
