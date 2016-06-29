require 'test_helper'

class ZonaUsuariosControllerTest < ActionController::TestCase
  setup do
    @zona_usuario = zona_usuarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:zona_usuarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create zona_usuario" do
    assert_difference('ZonaUsuario.count') do
      post :create, zona_usuario: { orden: @zona_usuario.orden, usuario_id: @zona_usuario.usuario_id, zona_id: @zona_usuario.zona_id }
    end

    assert_redirected_to zona_usuario_path(assigns(:zona_usuario))
  end

  test "should show zona_usuario" do
    get :show, id: @zona_usuario
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @zona_usuario
    assert_response :success
  end

  test "should update zona_usuario" do
    patch :update, id: @zona_usuario, zona_usuario: { orden: @zona_usuario.orden, usuario_id: @zona_usuario.usuario_id, zona_id: @zona_usuario.zona_id }
    assert_redirected_to zona_usuario_path(assigns(:zona_usuario))
  end

  test "should destroy zona_usuario" do
    assert_difference('ZonaUsuario.count', -1) do
      delete :destroy, id: @zona_usuario
    end

    assert_redirected_to zona_usuarios_path
  end
end
