require 'test_helper'

class EstadoMedidorsControllerTest < ActionController::TestCase
  setup do
    @estado_medidor = estado_medidors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estado_medidors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create estado_medidor" do
    assert_difference('EstadoMedidor.count') do
      post :create, estado_medidor: { demanda: @estado_medidor.demanda, estado_actual: @estado_medidor.estado_actual, estado_anterior: @estado_medidor.estado_anterior, fecha_medicion: @estado_medidor.fecha_medicion, fecha_modificacion: @estado_medidor.fecha_modificacion, novedad_id: @estado_medidor.novedad_id, observacion: @estado_medidor.observacion, promedio: @estado_medidor.promedio, user_id: @estado_medidor.user_id }
    end

    assert_redirected_to estado_medidor_path(assigns(:estado_medidor))
  end

  test "should show estado_medidor" do
    get :show, id: @estado_medidor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @estado_medidor
    assert_response :success
  end

  test "should update estado_medidor" do
    patch :update, id: @estado_medidor, estado_medidor: { demanda: @estado_medidor.demanda, estado_actual: @estado_medidor.estado_actual, estado_anterior: @estado_medidor.estado_anterior, fecha_medicion: @estado_medidor.fecha_medicion, fecha_modificacion: @estado_medidor.fecha_modificacion, novedad_id: @estado_medidor.novedad_id, observacion: @estado_medidor.observacion, promedio: @estado_medidor.promedio, user_id: @estado_medidor.user_id }
    assert_redirected_to estado_medidor_path(assigns(:estado_medidor))
  end

  test "should destroy estado_medidor" do
    assert_difference('EstadoMedidor.count', -1) do
      delete :destroy, id: @estado_medidor
    end

    assert_redirected_to estado_medidors_path
  end
end
