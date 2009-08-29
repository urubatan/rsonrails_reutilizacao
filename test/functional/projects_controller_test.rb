require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  def setup
    @request.session[:user_id] = 1
  end
  
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
    assert_template "projects/index"
  end

  def test_should_get_new
    get :new
    assert_response :success
    assert_template "projects/new"
  end

  def test_should_create_project
    assert_difference('Project.count') do
      post :create, :project => { :name => "Integration Test Project" }
    end

    assert_redirected_to project_path(assigns(:project))
  end

  def test_should_show_project
    get :show, :id => projects(:one).id
    assert_response :success
    assert_template "projects/show"
  end

  def test_should_get_edit
    get :edit, :id => projects(:one).id
    assert_response :success
    assert_template "projects/edit"
  end

  def test_should_update_project
    put :update, :id => projects(:one).id, :project => { :description => "Now the project has a description" }
    assert_redirected_to project_path(assigns(:project))
  end

  def test_should_destroy_project
    assert_difference('Project.count', -1) do
      delete :destroy, :id => projects(:one).id
    end

    assert_redirected_to projects_path
  end
end
