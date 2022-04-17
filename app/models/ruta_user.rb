class RutaUser < ApplicationRecord
  belongs_to :rutum, :foreign_key => 'rutum_id', :class_name => 'Rutum'
  belongs_to :user, :foreign_key => 'user_id', :class_name => 'User'
end
