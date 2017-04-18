json.array!(@empleados) do |empleado|
  json.extract! empleado, :id, :nro_legajo, :tipo_documento_id, :nro_documento, :apellido, :nombre, :estado_id, :fecha_alta, :fecha_baja
  json.url empleado_url(empleado, format: :json)
end
