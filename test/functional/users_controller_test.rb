require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  def test_should_get_index
    @request.session[:user_id] = 1
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  def test_should_get_new
    @request.session[:user_id] = 1
    get :new
    assert_response :success
  end

  def test_should_create_user
    @request.session[:user_id] = 1
    assert_difference('User.count') do
      post :create, :user => {:login => "testuser", :name => "Test User", :password => "password", :email => "any@any.any" }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  def test_should_show_user
    @request.session[:user_id] = 1
    get :show, :id => users(:usr1).id
    assert_response :success
  end

  def test_should_get_edit
    @request.session[:user_id] = 1
    get :edit, :id => users(:usr1).id
    assert_response :success
  end

  def test_should_update_user
    @request.session[:user_id] = 1
    put :update, :id => users(:usr1).id, :user => { :name => "Other Name" }
    assert_redirected_to user_path(assigns(:user))
    assert_equal "Other Name",assigns(:user).name
  end

  def test_should_destroy_user
    @request.session[:user_id] = 1
    assert_difference('User.count', -1) do
      delete :destroy, :id => users(:usr1).id
    end

    assert_redirected_to users_path
  end
end
