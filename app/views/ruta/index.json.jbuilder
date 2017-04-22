json.array!(@ruta) do |rutum|
  json.extract! rutum, :id, :numero, :nombre, :zona_id, :descripcion
  json.url rutum_url(rutum, format: :json)
end
