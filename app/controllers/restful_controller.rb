class RestfulController < ApplicationController
  #before_action :authenticate_user_from_token!, except: [:signin, :signup]
  skip_before_action :verify_authenticity_token
	
  # Autenticacion via android
  def signin
    user_password = params[:contrasenia]
    user_email = params[:nombre]    

    if user_email.present? && user_password.present?
      user = User.find_by(email: user_email)
      if user && user.valid_password?(user_password) && user.role?(:tomaestado)                         
        user.ensure_authentication_token
        user.save
        sign_in(user, scope: :user)        
        user = User.select('users.id, empleados.nro_legajo, users.email, users.authentication_token').joins(:empleado).find_by(email: user_email)
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
    user_email = params[:nombre].presence
    user = user_email && User.find_by_email(user_email)

    # Notice how we use Devise.secure_compare to compare the token
    # in the database with the token given in the params, mitigating
    # timing attacks.
    if user && Devise.secure_compare(user.authentication_token, params[:user_token])

      rutum = Rutum.joins(:users).find_by(users: {id: user.id}) 
      if !rutum.blank?
        ruta = Usuario.select("usuarios.id as id,
          usuarios.latitud as latitud,
          usuarios.longitud as longitud,
          usuarios.numero as numero,
          usuarios.domicilio_postal as domicilio_postal, 
          categoria.codigo as categoria, 
          medidors.numero as numero_medidor,
          medidors.multiplicador as multiplicador,
          ruta.zona_id as zona_id,
          medidors.tipo_medidor_id as tipo_medidor_id").joins(:rutum, :medidors, :categorium).where(ruta: {id: rutum.id})
        render json: { ruta: ruta }
      else
        render json: { errors: "No hay rutas asignadas para #{user.email}" }
      end
    else
      render json: { errors: "Necesitas iniciar sesión o crear una cuenta para poder continuar." }
    end
  end 

  #Actualmente no se esta usando
  def authenticate_user_from_token!
    user_email = params[:nombre].presence
    user = user_email && User.find_by_email(user_email)

    # Notice how we use Devise.secure_compare to compare the token
    # in the database with the token given in the params, mitigating
    # timing attacks.
    if user && Devise.secure_compare(user.authentication_token, params[:user_token])
      sign_in user, store: false
    end
  end
end
