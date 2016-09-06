json.array!(@medidors) do |medidor|
  json.extract! medidor, :id, :numero, :multiplicador, :marca, :modelo, :fecha_alta, :fecha_baja, :tipo_medidor_id
  json.url medidor_url(medidor, format: :json)
end
