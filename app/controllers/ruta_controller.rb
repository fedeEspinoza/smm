class RutaController < ApplicationController
  before_action :authenticate_user!
  before_action :set_rutum, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /ruta
  # GET /ruta.json
  def index
    @ruta = Rutum.all
    respond_to do |format|
      format.html
      format.pdf do      
        render pdf: 'listado_de_rutas',          
        orientation: 'Landscape',
        template: 'ruta/listado_de_rutas.html.erb'
      end
    end
  end

  # GET /ruta/1
  # GET /ruta/1.json
  def show
  end

  # GET /ruta/new
  def new
    @rutum = Rutum.new
    @usuarios = Usuario.all
  end

  # GET /ruta/1/edit
  def edit
    @usuarios = Usuario.all
  end

  # POST /ruta
  # POST /ruta.json
  def create
    @rutum = Rutum.new(rutum_params)

    respond_to do |format|
      if @rutum.save
        format.html { redirect_to @rutum, notice: 'Se ha creado una nueva Ruta.' }
        format.json { render :show, status: :created, location: @rutum }
      else
        @usuarios = Usuario.all
        format.html { render :new }
        format.json { render json: @rutum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ruta/1
  # PATCH/PUT /ruta/1.json
  def update
    respond_to do |format|
      if @rutum.update(rutum_params)
        format.html { redirect_to @rutum, notice: 'Se ha actualizado la Ruta.' }
        format.json { render :show, status: :ok, location: @rutum }
      else
        format.html { render :edit }
        format.json { render json: @rutum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ruta/1
  # DELETE /ruta/1.json
  def destroy
    @rutum.ruta_usuarios.destroy_all
    @rutum.destroy
    respond_to do |format|
      format.html { redirect_to ruta_url, notice: 'Se ha eliminado la Ruta.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rutum
      @rutum = Rutum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rutum_params
      params.require(:rutum).permit(:numero, :nombre, :zona_id, :descripcion, ruta_usuarios_attributes: [:id, :usuario_id, :_destroy])
    end
end
