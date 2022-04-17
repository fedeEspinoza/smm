class EstadoMedidorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_estado_medidor, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /estado_medidors
  # GET /estado_medidors.json
  def index
    if params[:medidor_id].present?
      medidor_id = Medidor.find(params[:medidor_id]).id
    else
      medidor_id = 0
    end 
    if params[:fecha_desde].present? && params[:fecha_hasta].present?
      ids = MedidorEstadoMedidor.where(medidor_id: medidor_id).map(&:estado_medidor_id)
      estados = EstadoMedidor.joins(:novedad, :user).where(id: ids).where("fecha_medicion >= ?", params[:fecha_desde].to_date.strftime("%Y-%m-%d")).where("fecha_medicion <= ?", params[:fecha_hasta].to_date.strftime("%Y-%m-%d")).order(fecha_medicion: :desc)
    else
      ids = MedidorEstadoMedidor.where(medidor_id: medidor_id).map(&:estado_medidor_id)
      estados = EstadoMedidor.joins(:novedad, :user).where(id: ids).order(fecha_medicion: :desc)
    end
    respond_to do |format|
      format.html
      format.json { render json: EstadoMedidorDatatable.new(params, query: estados, view_context: view_context) }
    end
  end

  #Index para mostrar mediciones por ruta
  def index_ruta
    @anio = Date.today.year
    @mes = Date.today.month
    
    if params[:ruta_id].present?
      ruta_id = Rutum.find(params[:ruta_id]).id
    else
      ruta_id = 0
    end
    if params[:mes].present? && params[:anio].present?
        ruta = Usuario.select("
          usuarios.numero as numero,
          usuarios.domicilio_servicio as domicilio_servicio, 
          medidors.numero as numero_medidor,
          medidors.marca as marca,
          medidors.modelo as modelo,
          medidors.tipo_medidor_id as tipo_medidor_id,
          estado_medidors.id as id_estado_medidor,
          estado_medidors.estado_actual as estado_actual,
          estado_medidors.promedio as promedio,
          estado_medidors.fecha_medicion as fecha_medicion"
          ).joins(:rutum, :categorium, :medidors).where(ruta: {id: ruta_id}).merge(
          Medidor.joins(:estado_medidors).
          where("date_part('month', estado_medidors.fecha_medicion) = ?",params[:mes]).
          where("date_part('year', estado_medidors.fecha_medicion) = ?",params[:anio])
        )
    else
        ruta = Usuario.select("
          usuarios.numero as numero,
          usuarios.domicilio_servicio as domicilio_servicio, 
          medidors.numero as numero_medidor,
          medidors.marca as marca,
          medidors.modelo as modelo,
          medidors.tipo_medidor_id as tipo_medidor_id,
          estado_medidors.id as id_estado_medidor,
          estado_medidors.estado_actual as estado_actual,
          estado_medidors.promedio as promedio,
          estado_medidors.fecha_medicion as fecha_medicion"
          ).joins(:rutum, :categorium, :medidors).where(ruta: {id: ruta_id}).merge(
          Medidor.joins(:estado_medidors)
        )
    end

    respond_to do |format|
      format.html
      format.json { render json: HistorialRutaDatatable.new(params, query: ruta, view_context: view_context) }
    end
  end

  # GET /estado_medidors/1
  # GET /estado_medidors/1.json
  def show    
    medidor_id = MedidorEstadoMedidor.where(estado_medidor_id: @estado_medidor.id).take.medidor_id
    @medidor = Medidor.find(medidor_id)
  end

  # GET /estado_medidors/new
  def new
    @estado_medidor = EstadoMedidor.new
  end

  # GET /estado_medidors/1/edit
  def edit
    medidor_id = MedidorEstadoMedidor.where(estado_medidor_id: @estado_medidor.id).take.medidor_id
    @medidor = Medidor.find(medidor_id)
  end

  # POST /estado_medidors
  # POST /estado_medidors.json
  def create
    @estado_medidor = EstadoMedidor.new(estado_medidor_params)

    respond_to do |format|
      if @estado_medidor.save
        format.html { redirect_to @estado_medidor, notice: 'Estado medidor was successfully created.' }
        format.json { render :show, status: :created, location: @estado_medidor }
      else
        format.html { render :new }
        format.json { render json: @estado_medidor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estado_medidors/1
  # PATCH/PUT /estado_medidors/1.json
  def update
    medidor_id = MedidorEstadoMedidor.where(estado_medidor_id: @estado_medidor.id).take.medidor_id
    @medidor = Medidor.find(medidor_id)
    respond_to do |format|
      @estado_medidor.fecha_modificacion = DateTime.now
      if @estado_medidor.update(estado_medidor_params)
        format.html { redirect_to @estado_medidor, notice: 'Se ha actualizado la Medición.' }
        format.json { render :show, status: :ok, location: @estado_medidor }
      else
        format.html { render :edit }
        format.json { render json: @estado_medidor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estado_medidors/1
  # DELETE /estado_medidors/1.json
  def destroy
    @estado_medidor.medidor_estado_medidors.destroy_all
    @estado_medidor.destroy    
    respond_to do |format|
      format.html { redirect_to estado_medidors_url, notice: 'Se ha eliminado la Medición..' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estado_medidor
      @estado_medidor = EstadoMedidor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estado_medidor_params
      params.require(:estado_medidor).permit(:novedad_id, :user_id, :estado_actual, :estado_anterior, :promedio, :demanda, :observacion, :fecha_medicion, :fecha_modificacion)
    end
end
