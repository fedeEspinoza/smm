require 'test_helper'

class HistorialMedicionsControllerTest < ActionController::TestCase
  setup do
    @historial_medicion = historial_medicions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:historial_medicions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create historial_medicion" do
    assert_difference('HistorialMedicion.count') do
      post :create, historial_medicion: { estado_medidor: @historial_medicion.estado_medidor, fecha_medicion: @historial_medicion.fecha_medicion, fecha_modificacion: @historial_medicion.fecha_modificacion, medidor_id: @historial_medicion.medidor_id, novedad_id: @historial_medicion.novedad_id, user_id: @historial_medicion.user_id }
    end

    assert_redirected_to historial_medicion_path(assigns(:historial_medicion))
  end

  test "should show historial_medicion" do
    get :show, id: @historial_medicion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @historial_medicion
    assert_response :success
  end

  test "should update historial_medicion" do
    patch :update, id: @historial_medicion, historial_medicion: { estado_medidor: @historial_medicion.estado_medidor, fecha_medicion: @historial_medicion.fecha_medicion, fecha_modificacion: @historial_medicion.fecha_modificacion, medidor_id: @historial_medicion.medidor_id, novedad_id: @historial_medicion.novedad_id, user_id: @historial_medicion.user_id }
    assert_redirected_to historial_medicion_path(assigns(:historial_medicion))
  end

  test "should destroy historial_medicion" do
    assert_difference('HistorialMedicion.count', -1) do
      delete :destroy, id: @historial_medicion
    end

    assert_redirected_to historial_medicions_path
  end
end
