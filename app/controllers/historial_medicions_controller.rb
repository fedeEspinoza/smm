class HistorialMedicionsController < ApplicationController
  before_action :set_historial_medicion, only: [:show, :edit, :update, :destroy]

  # GET /historial_medicions
  # GET /historial_medicions.json
  def index
    @historial_medicions = HistorialMedicion.all
  end

  # GET /historial_medicions/1
  # GET /historial_medicions/1.json
  def show
  end

  # GET /historial_medicions/new
  def new
    @historial_medicion = HistorialMedicion.new
  end

  # GET /historial_medicions/1/edit
  def edit
  end

  # POST /historial_medicions
  # POST /historial_medicions.json
  def create
    @historial_medicion = HistorialMedicion.new(historial_medicion_params)

    respond_to do |format|
      if @historial_medicion.save
        format.html { redirect_to @historial_medicion, notice: 'Historial medicion was successfully created.' }
        format.json { render :show, status: :created, location: @historial_medicion }
      else
        format.html { render :new }
        format.json { render json: @historial_medicion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /historial_medicions/1
  # PATCH/PUT /historial_medicions/1.json
  def update
    respond_to do |format|
      if @historial_medicion.update(historial_medicion_params)
        format.html { redirect_to @historial_medicion, notice: 'Historial medicion was successfully updated.' }
        format.json { render :show, status: :ok, location: @historial_medicion }
      else
        format.html { render :edit }
        format.json { render json: @historial_medicion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /historial_medicions/1
  # DELETE /historial_medicions/1.json
  def destroy
    @historial_medicion.destroy
    respond_to do |format|
      format.html { redirect_to historial_medicions_url, notice: 'Historial medicion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historial_medicion
      @historial_medicion = HistorialMedicion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def historial_medicion_params
      params.require(:historial_medicion).permit(:novedad_id, :medidor_id, :user_id, :estado_medidor, :fecha_medicion, :fecha_modificacion)
    end
end
