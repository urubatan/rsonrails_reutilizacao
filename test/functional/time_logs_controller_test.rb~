require 'test_helper'

class TimeLogsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:time_logs)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_time_log
    assert_difference('TimeLog.count') do
      post :create, :time_log => { }
    end

    assert_redirected_to time_log_path(assigns(:time_log))
  end

  def test_should_show_time_log
    get :show, :id => time_logs(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => time_logs(:one).id
    assert_response :success
  end

  def test_should_update_time_log
    put :update, :id => time_logs(:one).id, :time_log => { }
    assert_redirected_to time_log_path(assigns(:time_log))
  end

  def test_should_destroy_time_log
    assert_difference('TimeLog.count', -1) do
      delete :destroy, :id => time_logs(:one).id
    end

    assert_redirected_to time_logs_path
  end
end
