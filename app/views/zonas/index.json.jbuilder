json.array!(@zonas) do |zona|
  json.extract! zona, :id, :nombre, :grupo_id
  json.url zona_url(zona, format: :json)
end
