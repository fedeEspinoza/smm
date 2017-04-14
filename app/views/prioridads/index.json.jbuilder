json.array!(@prioridads) do |prioridad|
  json.extract! prioridad, :id, :descripcion, :valor
  json.url prioridad_url(prioridad, format: :json)
end
