class UsuarioPersonasController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_usuario_persona, only: [:show, :edit, :update, :destroy]

  # GET /usuario_personas
  # GET /usuario_personas.json
  def index
    @usuario_personas = UsuarioPersona.all
  end

  # GET /usuario_personas/1
  # GET /usuario_personas/1.json
  def show
  end

  # GET /usuario_personas/new
  def new
    @usuario_persona = UsuarioPersona.new
  end

  # GET /usuario_personas/1/edit
  def edit
  end

  # POST /usuario_personas
  # POST /usuario_personas.json
  def create
    @usuario_persona = UsuarioPersona.new(usuario_persona_params)

    respond_to do |format|
      if @usuario_persona.save
        format.html { redirect_to @usuario_persona, notice: 'Usuario persona was successfully created.' }
        format.json { render :show, status: :created, location: @usuario_persona }
      else
        format.html { render :new }
        format.json { render json: @usuario_persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuario_personas/1
  # PATCH/PUT /usuario_personas/1.json
  def update
    respond_to do |format|
      if @usuario_persona.update(usuario_persona_params)
        format.html { redirect_to @usuario_persona, notice: 'Usuario persona was successfully updated.' }
        format.json { render :show, status: :ok, location: @usuario_persona }
      else
        format.html { render :edit }
        format.json { render json: @usuario_persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuario_personas/1
  # DELETE /usuario_personas/1.json
  def destroy
    @usuario_persona.destroy
    respond_to do |format|
      format.html { redirect_to usuario_personas_url, notice: 'Usuario persona was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario_persona
      @usuario_persona = UsuarioPersona.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_persona_params
      params.require(:usuario_persona).permit(:usuario_id, :persona_id)
    end
end
