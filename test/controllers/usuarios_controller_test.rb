require 'test_helper'

class UsuariosControllerTest < ActionController::TestCase
  setup do
    @usuario = usuarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:usuarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create usuario" do
    assert_difference('Usuario.count') do
      post :create, usuario: { categorium_id: @usuario.categorium_id, circunscripcion: @usuario.circunscripcion, domicilio: @usuario.domicilio, fecha_alta: @usuario.fecha_alta, fecha_baja: @usuario.fecha_baja, latitud: @usuario.latitud, longitud: @usuario.longitud, manzana: @usuario.manzana, numero: @usuario.numero, parcela: @usuario.parcela, persona_id: @usuario.persona_id, razon_social: @usuario.razon_social, sector: @usuario.sector, tipo: @usuario.tipo, unidad_funcional: @usuario.unidad_funcional }
    end

    assert_redirected_to usuario_path(assigns(:usuario))
  end

  test "should show usuario" do
    get :show, id: @usuario
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @usuario
    assert_response :success
  end

  test "should update usuario" do
    patch :update, id: @usuario, usuario: { categorium_id: @usuario.categorium_id, circunscripcion: @usuario.circunscripcion, domicilio: @usuario.domicilio, fecha_alta: @usuario.fecha_alta, fecha_baja: @usuario.fecha_baja, latitud: @usuario.latitud, longitud: @usuario.longitud, manzana: @usuario.manzana, numero: @usuario.numero, parcela: @usuario.parcela, persona_id: @usuario.persona_id, razon_social: @usuario.razon_social, sector: @usuario.sector, tipo: @usuario.tipo, unidad_funcional: @usuario.unidad_funcional }
    assert_redirected_to usuario_path(assigns(:usuario))
  end

  test "should destroy usuario" do
    assert_difference('Usuario.count', -1) do
      delete :destroy, id: @usuario
    end

    assert_redirected_to usuarios_path
  end
end
