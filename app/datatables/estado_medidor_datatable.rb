class EstadoMedidorDatatable < AjaxDatatablesRails::Base

  include AjaxDatatablesRails::Extensions::Kaminari

  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= ['Novedad.descripcion', 'User.email', 'EstadoMedidor.estado_actual', 'EstadoMedidor.promedio', 'EstadoMedidor.demanda', 'EstadoMedidor.fecha_medicion', 'EstadoMedidor.fecha_medicion']
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= ['Novedad.descripcion', 'User.email', 'EstadoMedidor.estado_actual', 'EstadoMedidor.promedio', 'EstadoMedidor.demanda', 'EstadoMedidor.fecha_medicion', 'EstadoMedidor.fecha_medicion']
  end

  private

  def data
    records.map do |record|
      [
        record.novedad.to_s,
        record.user.to_s,
        record.estado_actual,
        record.promedio,
        record.fecha_medicion.to_s(:default),
        record.periodo,
        '<td class="text-center">
            <a class="btn btn-sm btn-default" href="'+Rails.application.routes.url_helpers.estado_medidor_path(record.id.to_s)+'"><span class="glyphicon glyphicon-search"></span></a>
            <a class="btn btn-sm btn-default" href="'+Rails.application.routes.url_helpers.edit_estado_medidor_path(record.id.to_s)+'"><span class="glyphicon glyphicon-pencil"></span></a>
            <a class="btn btn-sm btn-danger" data-confirm="¿Está seguro?" rel="nofollow" data-method="delete" href="'+Rails.application.routes.url_helpers.estado_medidor_path(record.id.to_s)+'"><span class="glyphicon glyphicon-trash"></span></a>
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
