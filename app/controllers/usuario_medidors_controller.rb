class UsuarioMedidorsController < ApplicationController
  before_action :authenticate_user!, :set_usuario_medidor, only: [:show, :edit, :update, :destroy]

  # GET /usuario_medidors
  # GET /usuario_medidors.json
  def index
    @usuario_medidors = UsuarioMedidor.all
  end

  # GET /usuario_medidors/1
  # GET /usuario_medidors/1.json
  def show
  end

  # GET /usuario_medidors/new
  def new
    @usuario_medidor = UsuarioMedidor.new
  end

  # GET /usuario_medidors/1/edit
  def edit
  end

  # POST /usuario_medidors
  # POST /usuario_medidors.json
  def create
    @usuario_medidor = UsuarioMedidor.new(usuario_medidor_params)

    respond_to do |format|
      if @usuario_medidor.save
        format.html { redirect_to @usuario_medidor, notice: 'Usuario medidor was successfully created.' }
        format.json { render :show, status: :created, location: @usuario_medidor }
      else
        format.html { render :new }
        format.json { render json: @usuario_medidor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuario_medidors/1
  # PATCH/PUT /usuario_medidors/1.json
  def update
    respond_to do |format|
      if @usuario_medidor.update(usuario_medidor_params)
        format.html { redirect_to @usuario_medidor, notice: 'Usuario medidor was successfully updated.' }
        format.json { render :show, status: :ok, location: @usuario_medidor }
      else
        format.html { render :edit }
        format.json { render json: @usuario_medidor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuario_medidors/1
  # DELETE /usuario_medidors/1.json
  def destroy
    @usuario_medidor.destroy
    respond_to do |format|
      format.html { redirect_to usuario_medidors_url, notice: 'Usuario medidor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario_medidor
      @usuario_medidor = UsuarioMedidor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_medidor_params
      params.require(:usuario_medidor).permit(:usuario_id, :medidor_id)
    end
end
