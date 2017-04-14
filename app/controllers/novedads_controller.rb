class NovedadsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_novedad, only: [:show, :edit, :update, :destroy]

  # GET /novedads
  # GET /novedads.json
  def index
    @novedads = Novedad.all
  end

  # GET /novedads/1
  # GET /novedads/1.json
  def show
  end

  # GET /novedads/new
  def new
    @novedad = Novedad.new
  end

  # GET /novedads/1/edit
  def edit
  end

  # POST /novedads
  # POST /novedads.json
  def create
    @novedad = Novedad.new(novedad_params)

    respond_to do |format|
      if @novedad.save
        format.html { redirect_to @novedad, notice: 'Se ha creado una nueva Novedad.' }
        format.json { render :show, status: :created, location: @novedad }
      else
        format.html { render :new }
        format.json { render json: @novedad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /novedads/1
  # PATCH/PUT /novedads/1.json
  def update
    respond_to do |format|
      if @novedad.update(novedad_params)
        format.html { redirect_to @novedad, notice: 'Se ha actualizado la novedad.' }
        format.json { render :show, status: :ok, location: @novedad }
      else
        format.html { render :edit }
        format.json { render json: @novedad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /novedads/1
  # DELETE /novedads/1.json
  def destroy
    @novedad.destroy
    respond_to do |format|
      format.html { redirect_to novedads_url, notice: 'Se ha eliminado la novedad.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_novedad
      @novedad = Novedad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def novedad_params
      params.require(:novedad).permit(:codigo, :descripcion, :prioridad_id, :codigo_servicio)
    end
end
