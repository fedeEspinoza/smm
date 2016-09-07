class Usuario < ActiveRecord::Base
  belongs_to :categorium
  belongs_to :estado
  belongs_to :persona

  def to_s
  	"#{self.razon_social} - #{usuario.persona.to_s}"
  end
end
