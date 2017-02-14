class RestfulController < ApplicationController
  skip_before_action :verify_authenticity_token
	
  # Autenticacion via android
  def log_in
    user_password = params[:contrasenia]
    user_email = params[:nombre]
    user = user_email.present? && User.find_by(email: user_email)

    if user
      if user.valid_password? user_password
        sign_in user
        #user.generate_authentication_token!
        user.save
        render plain: "1"
      else
        render plain: "0"
      end
    else
      render plain: "0"
    end
  end

  # Autenticacion via android
  def log_out
    user = User.find_by(auth_token: params[:id])
    #user.generate_authentication_token!
    user.save
    head 204
  end

  # Autenticacion via android
  def log_up
    user_password = params[:contrasenia]
    user_email = params[:nombre]

    if user_email.present? && user_password.present?
      user = User.new
      user.email = user_email
      user.password = user_password
      #user.generate_authentication_token!
      user.save
      render plain: "1"
    else
      render plain: "0"
    end
  end 
end
