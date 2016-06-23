json.array!(@grupos) do |grupo|
  json.extract! grupo, :id, :nombre, :descripcion, :codigo
  json.url grupo_url(grupo, format: :json)
end
