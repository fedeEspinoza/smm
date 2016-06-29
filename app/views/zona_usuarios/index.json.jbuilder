json.array!(@zona_usuarios) do |zona_usuario|
  json.extract! zona_usuario, :id, :zona_id, :usuario_id, :orden
  json.url zona_usuario_url(zona_usuario, format: :json)
end
