class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_roles, :foreign_key => 'user_id', :class_name => 'UserRole'
  has_many :roles, :through => :user_roles

  has_many :ruta_users, :foreign_key => 'user_id', :class_name => 'RutaUser'
  has_many :rutum, :through => :ruta_users

  belongs_to :empleado

  accepts_nested_attributes_for :empleado

  #validates :email, :presence => { :message => "Debe completar el campo Email" }
  #validates :password, :presence => { :message => "Debe completar el campo Contraseña" }
  #validates :password_confirmation, :presence => { :message => "Debe completar el campo Confirmar contraseña" }

  def to_s
  	self.email
  end

  def data_y_empleado
    "#{self.email} - #{self.empleado.tipo_documento}, #{self.empleado}"
  end

  def role?(role)
    return self.roles.find_by(descripcion: role.to_s)
  end


  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  private
  
  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end
end
