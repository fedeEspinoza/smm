class UsuariosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]

  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.all
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show    
    Leaflet.tile_layer = "http://tile.osm.org/{z}/{x}/{y}.png"
    # You can also use any other tile layer here if you don't want to use Cloudmade - see http://leafletjs.com/reference.html#tilelayer for more
    Leaflet.attribution = "Cooperativa de Servicios Públicos Limitados Consumo y Vivienda Rawson" #Detalle del copyright
    Leaflet.max_zoom = 18
  end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new 
    @usuario.persona = Persona.new
  end

  # GET /usuarios/1/edit
  def edit
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(usuario_params)    
    @usuario.estado_id = Estado.where(descripcion: "Alta").first.id #Estado "Alta"

    persona_params = usuario_params[:persona_attributes]
    persona = Persona.where(tipo_documento_id: persona_params[:tipo_documento_id], nro_documento: persona_params[:nro_documento]).first
    if !persona.blank?
      persona.update(persona_params)
      @usuario.persona = persona
    end

    respond_to do |format|                 
      if @usuario.save
        format.html { redirect_to @usuario, notice: 'Se ha creado un nuevo Usuario.' }
        format.json { render :show, status: :created, location: @usuario }
      else        
        format.html { render :new }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to @usuario, notice: 'Se ha actualizado el Usuario.' }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end      
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario_medidors = UsuarioMedidor.where(:usuario_id => @usuario.id)
    if !@usuario_medidors.empty?
      UsuarioMedidor.destroy_all(:usuario_id => @usuario.id)
    end
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Se ha eliminado el Usuario.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:usuario).permit(:categorium_id, :numero, :razon_social, :domicilio, :circunscripcion, :sector, :tipo, :manzana, :parcela, :unidad_funcional, :latitud, :longitud, :estado_id, :fecha_alta, :fecha_baja, persona_attributes: [:tipo_documento_id, :nro_documento, :apellido, :nombre, :telefono, :email], usuario_medidors_attributes: [:id, :medidor_id, :_destroy])
    end
end
