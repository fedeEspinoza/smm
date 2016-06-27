json.array!(@novedads) do |novedad|
  json.extract! novedad, :id, :codigo, :descripcion, :prioridad_id
  json.url novedad_url(novedad, format: :json)
end
