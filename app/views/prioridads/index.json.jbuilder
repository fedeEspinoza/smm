json.array!(@prioridads) do |prioridad|
  json.extract! prioridad, :id, :descripcion
  json.url prioridad_url(prioridad, format: :json)
end
