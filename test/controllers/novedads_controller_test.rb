require 'test_helper'

class NovedadsControllerTest < ActionController::TestCase
  setup do
    @novedad = novedads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:novedads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create novedad" do
    assert_difference('Novedad.count') do
      post :create, novedad: { codigo: @novedad.codigo, descripcion: @novedad.descripcion, prioridad_id: @novedad.prioridad_id }
    end

    assert_redirected_to novedad_path(assigns(:novedad))
  end

  test "should show novedad" do
    get :show, id: @novedad
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @novedad
    assert_response :success
  end

  test "should update novedad" do
    patch :update, id: @novedad, novedad: { codigo: @novedad.codigo, descripcion: @novedad.descripcion, prioridad_id: @novedad.prioridad_id }
    assert_redirected_to novedad_path(assigns(:novedad))
  end

  test "should destroy novedad" do
    assert_difference('Novedad.count', -1) do
      delete :destroy, id: @novedad
    end

    assert_redirected_to novedads_path
  end
end
