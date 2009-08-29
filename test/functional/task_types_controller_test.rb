require 'test_helper'

class TaskTypesControllerTest < ActionController::TestCase
  def setup
    @request.session[:user_id] = 1
  end
  
  def test_should_get_index
    get :index, :project_id => 1
    assert_response :success
    assert_not_nil assigns(:task_types)
  end

  def test_should_get_new
    get :new, :project_id => 1
    assert_response :success
    assert_tag :form, :attributes => {:action => project_task_types_path(projects(:one))}
  end

  def test_should_create_task_type
    assert_difference('TaskType.count') do
      post :create, :project_id => 1, :task_type => {:name => "Test Task Type", :project_id => 1 }
    end

    assert_redirected_to project_path(assigns(:task_type).project)
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end

  def test_should_update_task_type
    put :update, :id => 1, :task_type => { :name => "updated name" }
    assert_redirected_to project_path(assigns(:task_type).project)
    assert_equal "updated name", assigns(:task_type).name
  end

  def test_should_destroy_task_type
    assert_difference('TaskType.count', -1) do
      delete :destroy, :id => 1
    end

    assert_redirected_to project_path(assigns(:task_type).project)
  end
end
