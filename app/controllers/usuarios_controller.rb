class UsuariosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  skip_authorize_resource :only => :get_medidores

  # Para obtener medidores via AJAX
  def get_medidores    
    medidores = Medidor.select(
      "medidors.id as id,
       medidors.numero as numero,
       medidors.marca as marca,
       medidors.modelo as modelo,
       tipo_medidors.nombre as nombre_tipo_medidor"
      ).joins(:usuario_medidors, :tipo_medidor).where(usuario_medidors: {usuario_id: params[:usuario_id]})
    render json: medidores 
  end

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
    @usuario.fecha_alta = DateTime.now

    persona_params = usuario_params[:persona_attributes]
    persona = Persona.find_by(tipo_documento_id: persona_params[:tipo_documento_id], nro_documento: persona_params[:nro_documento])
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
    @usuario.usuario_medidors.destroy_all
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
      params.require(:usuario).permit(:categorium_id, :numero, :razon_social, :domicilio_postal, :domicilio_servicio, :circunscripcion, :sector, :tipo, :manzana, :parcela, :unidad_funcional, :latitud, :longitud, :fecha_alta, :fecha_baja, persona_attributes: [:tipo_documento_id, :nro_documento, :apellido, :nombre, :telefono, :email], usuario_medidors_attributes: [:id, :medidor_id, :_destroy])
    end
end
