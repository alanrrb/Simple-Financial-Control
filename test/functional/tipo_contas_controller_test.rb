require 'test_helper'

class TipoContasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_contas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_conta" do
    assert_difference('TipoConta.count') do
      post :create, :tipo_conta => { }
    end

    assert_redirected_to tipo_conta_path(assigns(:tipo_conta))
  end

  test "should show tipo_conta" do
    get :show, :id => tipo_contas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tipo_contas(:one).to_param
    assert_response :success
  end

  test "should update tipo_conta" do
    put :update, :id => tipo_contas(:one).to_param, :tipo_conta => { }
    assert_redirected_to tipo_conta_path(assigns(:tipo_conta))
  end

  test "should destroy tipo_conta" do
    assert_difference('TipoConta.count', -1) do
      delete :destroy, :id => tipo_contas(:one).to_param
    end

    assert_redirected_to tipo_contas_path
  end
end
