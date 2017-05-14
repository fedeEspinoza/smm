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
        mes_actual = EstadoMedidor.order(fecha_medicion: :desc).first.fecha_medicion.month
        anio_actual = EstadoMedidor.order(fecha_medicion: :desc).first.fecha_medicion.year
        ruta = Usuario.select("usuarios.id as id,
          usuarios.latitud as latitud,
          usuarios.longitud as longitud,
          usuarios.numero as numero,
          usuarios.domicilio_postal as domicilio_postal, 
          categoria.codigo as categoria, 
          medidors.numero as numero_medidor,
          medidors.multiplicador as multiplicador,
          ruta.zona_id as zona_id,
          medidors.tipo_medidor_id as tipo_medidor_id").joins(:rutum, :categorium, :medidors).where(ruta: {id: rutum.id}).merge(
          Medidor.select("
            medidors.id as id_medidor,  
            estado_medidors.estado_anterior as estado_anterior").joins(:estado_medidors).
          where("month(estado_medidors.fecha_medicion) = ?",mes_actual).
          where("year(estado_medidors.fecha_medicion) = ?",anio_actual)
        )
        render json: { ruta: ruta }
      else
        render json: { errors: "No hay rutas asignadas para #{user.email}" }
      end
    else
      render json: { errors: "Necesitas iniciar sesión o crear una cuenta para poder continuar." }
    end
  end 

  #Se utiliza solo para chequear que la ruta se descargue como corresponde. Eliminar cuando este terminado!!
  def chequear_ruta
    rutum = Rutum.joins(:users).find_by(users: {id: current_user.id}) 
      if !rutum.blank?
        mes_actual = EstadoMedidor.order(fecha_medicion: :desc).first.fecha_medicion.month
        anio_actual = EstadoMedidor.order(fecha_medicion: :desc).first.fecha_medicion.year
        ruta = Usuario.select("usuarios.id as id,
          usuarios.latitud as latitud,
          usuarios.longitud as longitud,
          usuarios.numero as numero,
          usuarios.domicilio_postal as domicilio_postal, 
          categoria.codigo as categoria, 
          medidors.numero as numero_medidor,
          medidors.multiplicador as multiplicador,
          ruta.zona_id as zona_id,
          medidors.tipo_medidor_id as tipo_medidor_id").joins(:rutum, :categorium, :medidors).where(ruta: {id: rutum.id}).merge(
          Medidor.select("
            medidors.id as id_medidor,  
            estado_medidors.id as id_estado_medidor,
            estado_medidors.estado_anterior as estado_anterior").joins(:estado_medidors).
          where("month(estado_medidors.fecha_medicion) = ?",mes_actual).
          where("year(estado_medidors.fecha_medicion) = ?",anio_actual)
        )
        render json: { ruta: ruta }
      else
        render json: { errors: "No hay rutas asignadas para #{current_user.email}" }
      end
  end

  #Guardar medicion
  def guardar_medicion
    user_email = params[:nombre].presence
    user = user_email && User.find_by_email(user_email)

    # Notice how we use Devise.secure_compare to compare the token
    # in the database with the token given in the params, mitigating
    # timing attacks.
    if user && Devise.secure_compare(user.authentication_token, params[:user_token])
      medidor = Medidor.find(params[:medidor_id])
      estado_medidor = EstadoMedidor.new
      estado_medidor.novedad_id = params[:novedad_id]
      estado_medidor.user_id = user.id
      estado_medidor.estado_actual = params[:estado_actual]
      estado_medidor.estado_anterior = params[:estado_anterior]
      estado_medidor.promedio = params[:promedio]
      estado_medidor.demanda = params[:demanda]
      estado_medidor.observacion = params[:observacion]
      estado_medidor.fecha_medicion = params[:fecha_medicion]
      if estado_medidor.save
        MedidorEstadoMedidor.create(medidor_id: medidor.id, estado_medidor_id: estado_medidor.id)
        render json: { message: "La medicion se guardo con exito!." }
      else
        render json: { errors: "Ocurrió un error al guardar el estado en el servidor." }
      end
    else
      render json: { errors: "Necesitas iniciar sesión o crear una cuenta para poder continuar." }
    end
  end 

  #Actualmente no se esta usando. Eliminar cuando este terminado
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
