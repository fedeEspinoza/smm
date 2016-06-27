require 'test_helper'

class TipoMedidorsControllerTest < ActionController::TestCase
  setup do
    @tipo_medidor = tipo_medidors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_medidors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_medidor" do
    assert_difference('TipoMedidor.count') do
      post :create, tipo_medidor: { codigo: @tipo_medidor.codigo, descripcion: @tipo_medidor.descripcion, nombre: @tipo_medidor.nombre }
    end

    assert_redirected_to tipo_medidor_path(assigns(:tipo_medidor))
  end

  test "should show tipo_medidor" do
    get :show, id: @tipo_medidor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_medidor
    assert_response :success
  end

  test "should update tipo_medidor" do
    patch :update, id: @tipo_medidor, tipo_medidor: { codigo: @tipo_medidor.codigo, descripcion: @tipo_medidor.descripcion, nombre: @tipo_medidor.nombre }
    assert_redirected_to tipo_medidor_path(assigns(:tipo_medidor))
  end

  test "should destroy tipo_medidor" do
    assert_difference('TipoMedidor.count', -1) do
      delete :destroy, id: @tipo_medidor
    end

    assert_redirected_to tipo_medidors_path
  end
end
