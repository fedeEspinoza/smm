require 'test_helper'

class UsuarioPersonasControllerTest < ActionController::TestCase
  setup do
    @usuario_persona = usuario_personas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:usuario_personas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create usuario_persona" do
    assert_difference('UsuarioPersona.count') do
      post :create, usuario_persona: { persona_id: @usuario_persona.persona_id, usuario_id: @usuario_persona.usuario_id }
    end

    assert_redirected_to usuario_persona_path(assigns(:usuario_persona))
  end

  test "should show usuario_persona" do
    get :show, id: @usuario_persona
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @usuario_persona
    assert_response :success
  end

  test "should update usuario_persona" do
    patch :update, id: @usuario_persona, usuario_persona: { persona_id: @usuario_persona.persona_id, usuario_id: @usuario_persona.usuario_id }
    assert_redirected_to usuario_persona_path(assigns(:usuario_persona))
  end

  test "should destroy usuario_persona" do
    assert_difference('UsuarioPersona.count', -1) do
      delete :destroy, id: @usuario_persona
    end

    assert_redirected_to usuario_personas_path
  end
end
