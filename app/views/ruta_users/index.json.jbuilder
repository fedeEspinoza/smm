json.array!(@ruta_users) do |ruta_user|
  json.extract! ruta_user, :id, :rutum_id, :user_id, :fecha_alta, :fecha_baja
  json.url ruta_user_url(ruta_user, format: :json)
end
