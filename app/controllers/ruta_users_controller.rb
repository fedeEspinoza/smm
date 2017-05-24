class RutaUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ruta_user, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /ruta_users
  # GET /ruta_users.json
  def index
    @ruta_users = RutaUser.all
    respond_to do |format|
      format.html
      format.pdf do      
        render pdf: 'listado_de_rutas_asignadas',          
        orientation: 'Landscape',
        template: 'ruta_users/listado_de_rutas_asignadas.html.erb'
      end
    end
  end

  # GET /ruta_users/1
  # GET /ruta_users/1.json
  def show
    @rutum = Rutum.find(@ruta_user.rutum_id)
    respond_to do |format|
      format.html
      format.pdf do      
        render pdf: 'ruta_tomaestado',          
        orientation: 'Landscape',
        template: 'ruta_users/ruta_tomaestado.html.erb'
      end
    end
  end

  # GET /ruta_users/new
  def new
    @ruta_user = RutaUser.new
  end

  # GET /ruta_users/1/edit
  def edit
    @rutum = Rutum.find(@ruta_user.rutum_id)
  end

  # POST /ruta_users
  # POST /ruta_users.json
  def create
    @ruta_user = RutaUser.new(ruta_user_params)
    @ruta_user.fecha_alta = DateTime.now

    respond_to do |format|
      if @ruta_user.save
        format.html { redirect_to @ruta_user, notice: 'La Ruta ha sido asignada.' }
        format.json { render :show, status: :created, location: @ruta_user }
      else
        format.html { render :new }
        format.json { render json: @ruta_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ruta_users/1
  # PATCH/PUT /ruta_users/1.json
  def update
    respond_to do |format|
      if @ruta_user.update(ruta_user_params)
        format.html { redirect_to @ruta_user, notice: 'Se ha actualizado la asignación.' }
        format.json { render :show, status: :ok, location: @ruta_user }
      else
        format.html { render :edit }
        format.json { render json: @ruta_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ruta_users/1
  # DELETE /ruta_users/1.json
  def destroy
    @ruta_user.destroy
    respond_to do |format|
      format.html { redirect_to ruta_users_url, notice: 'Se ha eliminado la asignación.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ruta_user
      @ruta_user = RutaUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ruta_user_params
      params.require(:ruta_user).permit(:rutum_id, :user_id, :fecha_alta, :fecha_baja)
    end
end
