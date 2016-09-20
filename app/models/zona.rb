class Zona < ActiveRecord::Base
  belongs_to :grupo

  validates :nombre, presence: true
end
