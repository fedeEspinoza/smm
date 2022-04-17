class EstadoMedidorDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegators :@view, :link_to

  def view_columns
    @view_columns ||= {
      novedad:        { source: "Novedad.descripcion", cond: :like },
      user:           { source: "User.email", cond: :like },
      estado_actual:  { source: "EstadoMedidor.estado_actual", cond: :like },
      promedio:       { source: "EstadoMedidor.promedio", cond: :like },
      fecha_medicion: { source: "EstadoMedidor.fecha_medicion", cond: :like },
      periodo:        { source: "EstadoMedidor.periodo", cond: :like },
      dt_actions:     { source: "EstadoMedidor.id" }
    }
  end

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  private

  def data
    records.map do |record|
      {
        novedad: record.novedad.to_s,
        user: record.user.to_s,
        estado_actual: record.estado_actual,
        promedio: record.promedio,
        fecha_medicion: record.fecha_medicion.to_s(:default),
        periodo: record.periodo,
        dt_actions: record.decorate.dt_actions
        # comma separated list of the values for each cell of a table row
        # example: record.attribute,
      }
    end
  end

  def get_raw_records
    # insert query here
    return options[:query]
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
