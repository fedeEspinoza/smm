json.array!(@historial_medicions) do |historial_medicion|
  json.extract! historial_medicion, :id, :novedad_id, :medidor_id, :user_id, :estado_medidor, :fecha_medicion, :fecha_modificacion
  json.url historial_medicion_url(historial_medicion, format: :json)
end
