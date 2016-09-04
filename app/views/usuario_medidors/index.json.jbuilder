json.array!(@usuario_medidors) do |usuario_medidor|
  json.extract! usuario_medidor, :id, :usuario_id, :medidor_id, :fecha_alta, :fecha_baja
  json.url usuario_medidor_url(usuario_medidor, format: :json)
end
