class RutaUsersController < ApplicationController
  before_action :set_ruta_user, only: [:show, :edit, :update, :destroy]

  # GET /ruta_users
  # GET /ruta_users.json
  def index
    @ruta_users = RutaUser.all
  end

  # GET /ruta_users/1
  # GET /ruta_users/1.json
  def show
  end

  # GET /ruta_users/new
  def new
    @ruta_user = RutaUser.new
  end

  # GET /ruta_users/1/edit
  def edit
  end

  # POST /ruta_users
  # POST /ruta_users.json
  def create
    @ruta_user = RutaUser.new(ruta_user_params)
    @ruta_user.fecha_alta = DateTime.now

    respond_to do |format|
      if @ruta_user.save
        format.html { redirect_to @ruta_user, notice: 'Ruta user was successfully created.' }
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
        format.html { redirect_to @ruta_user, notice: 'Ruta user was successfully updated.' }
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
      format.html { redirect_to ruta_users_url, notice: 'Ruta user was successfully destroyed.' }
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
