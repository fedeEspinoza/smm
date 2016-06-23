json.array!(@categoria) do |categorium|
  json.extract! categorium, :id, :codigo, :descripcion
  json.url categorium_url(categorium, format: :json)
end
