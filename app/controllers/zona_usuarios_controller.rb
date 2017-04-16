class ZonaUsuariosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_zona_usuario, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /zona_usuarios
  # GET /zona_usuarios.json
  def index
    @zona_usuarios = ZonaUsuario.all
  end

  # GET /zona_usuarios/1
  # GET /zona_usuarios/1.json
  def show
  end

  # GET /zona_usuarios/new
  def new
    @zona_usuario = ZonaUsuario.new
  end

  # GET /zona_usuarios/1/edit
  def edit
  end

  # POST /zona_usuarios
  # POST /zona_usuarios.json
  def create
    @zona_usuario = ZonaUsuario.new(zona_usuario_params)

    respond_to do |format|
      if @zona_usuario.save
        format.html { redirect_to @zona_usuario, notice: 'Zona usuario was successfully created.' }
        format.json { render :show, status: :created, location: @zona_usuario }
      else
        format.html { render :new }
        format.json { render json: @zona_usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /zona_usuarios/1
  # PATCH/PUT /zona_usuarios/1.json
  def update
    respond_to do |format|
      if @zona_usuario.update(zona_usuario_params)
        format.html { redirect_to @zona_usuario, notice: 'Zona usuario was successfully updated.' }
        format.json { render :show, status: :ok, location: @zona_usuario }
      else
        format.html { render :edit }
        format.json { render json: @zona_usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /zona_usuarios/1
  # DELETE /zona_usuarios/1.json
  def destroy
    @zona_usuario.destroy
    respond_to do |format|
      format.html { redirect_to zona_usuarios_url, notice: 'Zona usuario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zona_usuario
      @zona_usuario = ZonaUsuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def zona_usuario_params
      params.require(:zona_usuario).permit(:zona_id, :usuario_id, :orden)
    end
end
