require 'test_helper'

class UsuarioMedidorsControllerTest < ActionController::TestCase
  setup do
    @usuario_medidor = usuario_medidors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:usuario_medidors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create usuario_medidor" do
    assert_difference('UsuarioMedidor.count') do
      post :create, usuario_medidor: { fecha_alta: @usuario_medidor.fecha_alta, fecha_baja: @usuario_medidor.fecha_baja, medidor_id: @usuario_medidor.medidor_id, usuario_id: @usuario_medidor.usuario_id }
    end

    assert_redirected_to usuario_medidor_path(assigns(:usuario_medidor))
  end

  test "should show usuario_medidor" do
    get :show, id: @usuario_medidor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @usuario_medidor
    assert_response :success
  end

  test "should update usuario_medidor" do
    patch :update, id: @usuario_medidor, usuario_medidor: { fecha_alta: @usuario_medidor.fecha_alta, fecha_baja: @usuario_medidor.fecha_baja, medidor_id: @usuario_medidor.medidor_id, usuario_id: @usuario_medidor.usuario_id }
    assert_redirected_to usuario_medidor_path(assigns(:usuario_medidor))
  end

  test "should destroy usuario_medidor" do
    assert_difference('UsuarioMedidor.count', -1) do
      delete :destroy, id: @usuario_medidor
    end

    assert_redirected_to usuario_medidors_path
  end
end
