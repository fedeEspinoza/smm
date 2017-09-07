class MedidorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_medidor, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /medidors
  # GET /medidors.json
  def index
    @medidors = Medidor.all
  end

  # GET /medidors/1
  # GET /medidors/1.json
  def show
  end

  # GET /medidors/new
  def new
    @medidor = Medidor.new
  end

  # GET /medidors/1/edit
  def edit
  end

  # POST /medidors
  # POST /medidors.json
  def create
    @medidor = Medidor.new(medidor_params)
    @medidor.fecha_alta = DateTime.now

    respond_to do |format|
      if @medidor.save
        estado_medidor = EstadoMedidor.create(novedad_id: 1, user_id: current_user.id, estado_actual: 0, estado_anterior: 0, promedio: 0,fecha_medicion: DateTime.now)
        MedidorEstadoMedidor.create(medidor_id: @medidor.id, estado_medidor_id: estado_medidor.id)
        format.html { redirect_to @medidor, notice: 'Se ha creado un nuevo Medidor.' }
        format.json { render :show, status: :created, location: @medidor }
      else
        format.html { render :new }
        format.json { render json: @medidor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medidors/1
  # PATCH/PUT /medidors/1.json
  def update
    respond_to do |format|
      if @medidor.update(medidor_params)
        format.html { redirect_to @medidor, notice: 'Se ha actualizado el Medidor.' }
        format.json { render :show, status: :ok, location: @medidor }
      else
        format.html { render :edit }
        format.json { render json: @medidor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medidors/1
  # DELETE /medidors/1.json
  def destroy    
    estado_ids = @medidor.medidor_estado_medidors.map(&:estado_medidor_id)
    @medidor.medidor_estado_medidors.destroy_all
    EstadoMedidor.where(id: estado_ids).destroy_all
    @medidor.destroy
    respond_to do |format|
      format.html { redirect_to medidors_url, notice: 'Se ha eliminado el Medidor.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medidor
      @medidor = Medidor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medidor_params
      params.require(:medidor).permit(:numero, :multiplicador, :marca, :modelo, :fecha_alta, :fecha_baja, :tipo_medidor_id)
    end
end
