class RestfulController < ApplicationController
  skip_before_action :verify_authenticity_token
	
  # Autenticacion via android
  def signin
    user_password = params[:contrasenia]
    user_email = params[:nombre]
    user = user_email.present? && User.find_by(email: user_email)

    if user
      if user.valid_password? user_password
        sign_in user
        user.save
        #render plain: "1"
        render json: user.to_json
      else
        render plain: "0"
      end
    else
      render plain: "0"
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
      render plain: "1"
    else
      render plain: "0"
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
