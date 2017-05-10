class EstadoMedidorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_estado_medidor, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /estado_medidors
  # GET /estado_medidors.json
  def index
    if params[:medidor_id].present?
      medidor_id = Medidor.find_by(id: params[:medidor_id]).id
    else
      medidor_id = 0
    end    
    ids = MedidorEstadoMedidor.where(medidor_id: medidor_id).map(&:estado_medidor_id)
    estados = EstadoMedidor.joins(:novedad, :user).where(id: ids).order(fecha_medicion: :desc)
    respond_to do |format|
      format.html
      format.json { render json: EstadoMedidorDatatable.new(view_context,{query: estados}) }
    end
  end

  # GET /estado_medidors/1
  # GET /estado_medidors/1.json
  def show
  end

  # GET /estado_medidors/new
  def new
    @estado_medidor = EstadoMedidor.new
  end

  # GET /estado_medidors/1/edit
  def edit
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
    respond_to do |format|
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
