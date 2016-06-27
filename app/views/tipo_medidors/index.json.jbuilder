json.array!(@tipo_medidors) do |tipo_medidor|
  json.extract! tipo_medidor, :id, :nombre, :codigo, :descripcion
  json.url tipo_medidor_url(tipo_medidor, format: :json)
end
