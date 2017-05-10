json.array!(@estado_medidors) do |estado_medidor|
  json.extract! estado_medidor, :id, :novedad_id, :user_id, :estado_actual, :estado_anterior, :promedio, :demanda, :observacion, :fecha_medicion, :fecha_modificacion
  json.url estado_medidor_url(estado_medidor, format: :json)
end
