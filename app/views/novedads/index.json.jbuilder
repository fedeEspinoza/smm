json.array!(@novedads) do |novedad|
  json.extract! novedad, :id, :codigo, :descripcion, :prioridad_id, :codigo_servicio
  json.url novedad_url(novedad, format: :json)
end
