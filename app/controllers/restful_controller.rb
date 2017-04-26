class RestfulController < ApplicationController
  skip_before_action :verify_authenticity_token
	
  # Autenticacion via android
  def signin
    user_password = params[:contrasenia]
    user_email = params[:nombre]    

    if user_email.present? && user_password.present?
      user = User.find_by(email: user_email)
      if user && user.valid_password?(user_password)
        sign_in user
        user.save        
        user = User.select('users.id, empleados.nro_legajo, users.email').joins(:empleado).find_by(email: user_email)
        render json: user.to_json
      else
        render json: { errors: "El nombre de usuario o la clave ingresada son incorrectas" }        
      end
    else
      render json: { errors: "Debe completar el campo usuario y clave" }
    end
  end

  # Creacion de usuario via android
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
    rutum = Rutum.joins(:users).find_by(users: {id: current_user.id}) 
    if !rutum.blank?
      ruta = Usuario.select("usuarios.latitud as latitud,
        usuarios.longitud as longitud,
        usuarios.numero as numero,
        usuarios.domicilio_postal as domicilio_postal, 
        categoria.codigo as categoria, 
        medidors.numero as numero_medidor,
        medidors.multiplicador as multiplicador,
        ruta.zona_id as zona_id,
        medidors.tipo_medidor_id as tipo_medidor_id").joins(:rutum, :medidors, :categorium).where(ruta: {id: rutum.id})
        render json: { ruta: ruta.to_json }
    else
      render json: { errors: "No hay rutas asignadas para el tomaestado actual" }
    end
  end 
end
