json.array!(@usuarios) do |usuario|
  json.extract! usuario, :id, :categorium_id, :numero, :razon_social, :domicilio, :circunscripcion, :sector, :tipo, :manzana, :parcela, :unidad_funcional, :latitud, :longitud, :estado_id, :persona_id
  json.url usuario_url(usuario, format: :json)
end
