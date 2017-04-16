class PrioridadsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_prioridad, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /prioridads
  # GET /prioridads.json
  def index
    @prioridads = Prioridad.all
  end

  # GET /prioridads/1
  # GET /prioridads/1.json
  def show
  end

  # GET /prioridads/new
  def new
    @prioridad = Prioridad.new
  end

  # GET /prioridads/1/edit
  def edit
  end

  # POST /prioridads
  # POST /prioridads.json
  def create
    @prioridad = Prioridad.new(prioridad_params)

    respond_to do |format|
      if @prioridad.save
        format.html { redirect_to @prioridad, notice: 'Se ha creado una nueva Prioridad.' }
        format.json { render :show, status: :created, location: @prioridad }
      else
        format.html { render :new }
        format.json { render json: @prioridad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prioridads/1
  # PATCH/PUT /prioridads/1.json
  def update
    respond_to do |format|
      if @prioridad.update(prioridad_params)
        format.html { redirect_to @prioridad, notice: 'Se ha actualizado la Prioridad.' }
        format.json { render :show, status: :ok, location: @prioridad }
      else
        format.html { render :edit }
        format.json { render json: @prioridad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prioridads/1
  # DELETE /prioridads/1.json
  def destroy
    @prioridad.destroy
    respond_to do |format|
      format.html { redirect_to prioridads_url, notice: 'Se ha eliminado la Prioridad.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prioridad
      @prioridad = Prioridad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prioridad_params
      params.require(:prioridad).permit(:descripcion, :valor)
    end
end
