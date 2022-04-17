class EstadoMedidorDecorator < Draper::Decorator
  delegate_all

  # Just an example of a complex method you can add to you decorator
  # To render it in a datatable just add a column 'dt_actions' in
  # 'view_columns' and 'data' methods and call record.decorate.dt_actions
  def dt_actions
    links = []
    links << h.link_to('<span class="glyphicon glyphicon-search"></span>'.html_safe, object, :class => 'btn btn-sm btn-default')
    links << h.link_to('<span class="glyphicon glyphicon-pencil"></span>'.html_safe, h.edit_estado_medidor_path(object), :class => 'btn btn-sm btn-primary')
    links << h.link_to('<span class="glyphicon glyphicon-trash"></span>'.html_safe, object, method: :delete, data: { confirm: 'Estás seguro?' }, :class => 'btn btn-sm btn-danger')
    h.safe_join(links, '&nbsp;'.html_safe)
  end

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
