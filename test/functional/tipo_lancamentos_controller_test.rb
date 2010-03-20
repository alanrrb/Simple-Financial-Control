require 'test_helper'

class TipoLancamentosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_lancamentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_lancamento" do
    assert_difference('TipoLancamento.count') do
      post :create, :tipo_lancamento => { }
    end

    assert_redirected_to tipo_lancamento_path(assigns(:tipo_lancamento))
  end

  test "should show tipo_lancamento" do
    get :show, :id => tipo_lancamentos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tipo_lancamentos(:one).to_param
    assert_response :success
  end

  test "should update tipo_lancamento" do
    put :update, :id => tipo_lancamentos(:one).to_param, :tipo_lancamento => { }
    assert_redirected_to tipo_lancamento_path(assigns(:tipo_lancamento))
  end

  test "should destroy tipo_lancamento" do
    assert_difference('TipoLancamento.count', -1) do
      delete :destroy, :id => tipo_lancamentos(:one).to_param
    end

    assert_redirected_to tipo_lancamentos_path
  end
end
