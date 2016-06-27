json.array!(@personas) do |persona|
  json.extract! persona, :id, :tipo_documento_id, :nro_documento, :apellido, :nombre, :telefono, :email
  json.url persona_url(persona, format: :json)
end
