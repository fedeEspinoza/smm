class Usuario < ActiveRecord::Base
  belongs_to :categorium
  belongs_to :estado
end
