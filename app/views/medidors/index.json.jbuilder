json.array!(@medidors) do |medidor|
  json.extract! medidor, :id, :numero, :multiplicador, :tipo_medidor_id
  json.url medidor_url(medidor, format: :json)
end
