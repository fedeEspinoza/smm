class TipoMedidorsController < ApplicationController
  before_action :set_tipo_medidor, only: [:show, :edit, :update, :destroy]

  # GET /tipo_medidors
  # GET /tipo_medidors.json
  def index
    @tipo_medidors = TipoMedidor.all
  end

  # GET /tipo_medidors/1
  # GET /tipo_medidors/1.json
  def show
  end

  # GET /tipo_medidors/new
  def new
    @tipo_medidor = TipoMedidor.new
  end

  # GET /tipo_medidors/1/edit
  def edit
  end

  # POST /tipo_medidors
  # POST /tipo_medidors.json
  def create
    @tipo_medidor = TipoMedidor.new(tipo_medidor_params)

    respond_to do |format|
      if @tipo_medidor.save
        format.html { redirect_to @tipo_medidor, notice: 'Se ha creado un nuevo Tipo de Medidor.' }
        format.json { render :show, status: :created, location: @tipo_medidor }
      else
        format.html { render :new }
        format.json { render json: @tipo_medidor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_medidors/1
  # PATCH/PUT /tipo_medidors/1.json
  def update
    respond_to do |format|
      if @tipo_medidor.update(tipo_medidor_params)
        format.html { redirect_to @tipo_medidor, notice: 'Se ha actualizado el Tipo de Medidor.' }
        format.json { render :show, status: :ok, location: @tipo_medidor }
      else
        format.html { render :edit }
        format.json { render json: @tipo_medidor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_medidors/1
  # DELETE /tipo_medidors/1.json
  def destroy
    @tipo_medidor.destroy
    respond_to do |format|
      format.html { redirect_to tipo_medidors_url, notice: 'Se ha eliminado el Tipo de Medidor.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_medidor
      @tipo_medidor = TipoMedidor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_medidor_params
      params.require(:tipo_medidor).permit(:nombre, :codigo, :descripcion)
    end
end
