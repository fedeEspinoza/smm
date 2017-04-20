class RestfulController < ApplicationController
  skip_before_action :verify_authenticity_token
	
  # Autenticacion via android
  def signin
    user_password = params[:contrasenia]
    user_email = params[:nombre]    

    if user_email.present? && user_password.present?
      user = User.find_by(email: user_email)
      if user.valid_password? user_password
        sign_in user
        user.save
        render json: user.joins(:empleado).to_json
      else
        render json: { errors: "El nombre de usuario o la clave ingresada son incorrectas" }        
      end
    else
      render json: { errors: "Debe completar el campo usuario y clave" }
    end
  end

  # Autenticacion via android
  def signup
    user_password = params[:contrasenia]
    user_email = params[:nombre]

    if user_email.present? && user_password.present?
      user = User.new
      user.email = user_email
      user.password = user_password
      user.save
      render json: user.to_json
    else
      render json: { errors: "Debe completar el campo usuario y clave" }
    end
  end 

  #Descargar ruta
  def descargar_ruta
    ruta = Usuario.select("usuarios.latitud as latitud,
      usuarios.longitud as longitud,
      usuarios.numero as numero,
      usuarios.domicilio_postal, 
      categoria.codigo as categoria, 
      medidors.numero as numero_medidor,
      medidors.multiplicador as multiplicador,
      medidors.tipo_medidor_id as tipo_medidor_id,
      zonas.id as zona_id").joins(:zona_usuarios, :categorium, :zonas, :usuario_medidors, :medidors)

    render json: ruta.to_json
  end 
end
