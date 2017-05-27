class HistorialRutaDatatable < AjaxDatatablesRails::Base

  include AjaxDatatablesRails::Extensions::Kaminari

  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= ['Usuario.numero', 'Medidor.numero', 'EstadoMedidor.fecha_medicion']
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= ['Usuario.numero', 'Medidor.numero', 'EstadoMedidor.fecha_medicion']
  end

  def as_json(options = {})
    {
      recordsTotal: total_records(options),
      recordsFiltered: filtered_records(options),
      data: data
    }
  end

  def total_records options
    get_raw_records.count(:all)
  end

  def filtered_records options
    get_raw_records.model.from("(#{filter_records(get_raw_records).except(:limit, :offset, :order).to_sql}) AS foo").count
  end

  private

  def data
    records.map do |record|
      [
        "<b>Usuario N°: #{record.numero}</b> <br/> Dom. de serv.: #{record.domicilio_servicio}",
        "<b>Medidor N°: #{record.numero_medidor}</b> <br/> #{record.marca} - #{record.modelo} (#{TipoMedidor.find(record.tipo_medidor_id)})",
        "<b>Estado actual: #{record.estado_actual}</b>, Cons. promedio: #{record.promedio}, <br/> Fecha de medición: #{record.fecha_medicion}",
        '<td class="text-center">            
	        <a class="btn btn-xs btn-default" href="'+Rails.application.routes.url_helpers.estado_medidor_path(record.id_estado_medidor.to_s)+'"><span class="glyphicon glyphicon-search"></span></a>
            <a class="btn btn-xs btn-default" href="'+Rails.application.routes.url_helpers.edit_estado_medidor_path(record.id_estado_medidor.to_s)+'"><span class="glyphicon glyphicon-pencil"></span></a>
            <a class="btn btn-xs btn-danger" data-confirm="¿Está seguro?" rel="nofollow" data-method="delete" href="'+Rails.application.routes.url_helpers.estado_medidor_path(record.id_estado_medidor.to_s)+'"><span class="glyphicon glyphicon-trash"></span></a>
        </td>'        
        # comma separated list of the values for each cell of a table row
        # example: record.attribute,
      ]
    end
  end

  def get_raw_records
    # insert query here
    return options[:query]
  end

  # ==== Insert 'presenter'-like methods below if necessary
end