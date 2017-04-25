require 'test_helper'

class RutaUsersControllerTest < ActionController::TestCase
  setup do
    @ruta_user = ruta_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ruta_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ruta_user" do
    assert_difference('RutaUser.count') do
      post :create, ruta_user: { fecha_alta: @ruta_user.fecha_alta, fecha_baja: @ruta_user.fecha_baja, rutum_id: @ruta_user.rutum_id, user_id: @ruta_user.user_id }
    end

    assert_redirected_to ruta_user_path(assigns(:ruta_user))
  end

  test "should show ruta_user" do
    get :show, id: @ruta_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ruta_user
    assert_response :success
  end

  test "should update ruta_user" do
    patch :update, id: @ruta_user, ruta_user: { fecha_alta: @ruta_user.fecha_alta, fecha_baja: @ruta_user.fecha_baja, rutum_id: @ruta_user.rutum_id, user_id: @ruta_user.user_id }
    assert_redirected_to ruta_user_path(assigns(:ruta_user))
  end

  test "should destroy ruta_user" do
    assert_difference('RutaUser.count', -1) do
      delete :destroy, id: @ruta_user
    end

    assert_redirected_to ruta_users_path
  end
end
