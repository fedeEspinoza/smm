class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    @user.empleado = Empleado.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    empleado = Empleado.new(user_params[:empleado_attributes]) 
    empleado.estado_id = Estado.where(descripcion: "Alta").first.id #Estado "Alta"
    empleado.fecha_alta = DateTime.now
    @user.empleado = empleado


    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Se ha creado un nuevo User.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Se ha actualizado el User.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user_roles = UserRole.where(user_id: @user.id)
    if !@user_roles.empty?
      UserRole.destroy_all(:user_id => @user.id)
    end
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Se ha eliminado el User.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, empleado_attributes: [:tipo_documento_id, :nro_documento, :nro_legajo, :apellido, :nombre], role_ids: [])
    end
end
