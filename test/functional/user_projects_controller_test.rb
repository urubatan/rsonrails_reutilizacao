require 'test_helper'

class UserProjectsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_project" do
    assert_difference('UserProject.count') do
      post :create, :user_project => { }
    end

    assert_redirected_to user_project_path(assigns(:user_project))
  end

  test "should show user_project" do
    get :show, :id => user_projects(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => user_projects(:one).to_param
    assert_response :success
  end

  test "should update user_project" do
    put :update, :id => user_projects(:one).to_param, :user_project => { }
    assert_redirected_to user_project_path(assigns(:user_project))
  end

  test "should destroy user_project" do
    assert_difference('UserProject.count', -1) do
      delete :destroy, :id => user_projects(:one).to_param
    end

    assert_redirected_to user_projects_path
  end
end
