require 'test_helper'

class StoryStatesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:story_states)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create story_state" do
    assert_difference('StoryState.count') do
      post :create, :story_state => { }
    end

    assert_redirected_to story_state_path(assigns(:story_state))
  end

  test "should show story_state" do
    get :show, :id => story_states(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => story_states(:one).to_param
    assert_response :success
  end

  test "should update story_state" do
    put :update, :id => story_states(:one).to_param, :story_state => { }
    assert_redirected_to story_state_path(assigns(:story_state))
  end

  test "should destroy story_state" do
    assert_difference('StoryState.count', -1) do
      delete :destroy, :id => story_states(:one).to_param
    end

    assert_redirected_to story_states_path
  end
end
