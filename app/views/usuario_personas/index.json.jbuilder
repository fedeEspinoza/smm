json.array!(@usuario_personas) do |usuario_persona|
  json.extract! usuario_persona, :id, :usuario_id, :persona_id
  json.url usuario_persona_url(usuario_persona, format: :json)
end
