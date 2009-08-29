require 'test_helper'

class LoginCreateAndJoinAProjectTest < ActionController::IntegrationTest
  fixtures :users

  def test_routes
    p = Project.new
    p.id = 1
    assert_routing project_path(p), {:controller => "projects", :action => "show", :id => "1"}
    assert_routing project_task_types_path(p), {:controller => "task_types", :action => "index", :project_id => "1"}
  end
  
  def test_not_logged_in
    get projects_path
    assert_redirected_to new_session_path
  end
  
  def test_login_create_project_and_join
    user = user_session_for_testing
    user.login
    user.list_projects
    user.create_project
    user.join_project
    user.list_projects_again
  end
  
  def user_session_for_testing
    open_session do |user|
      def user.login
        post sessions_path, :login => "user1", :password => "user1"
        assert_redirected_to root_path
      end
      
      def user.list_projects
        get projects_path
        assert_response :success
        assert_template "projects/index"
      end
      
      def user.create_project
        assert_difference('Project.count') do
          post projects_path, :project => { :name => "Integration Test Project to Join" }
        end
        assert_not_nil assigns(:project)
        @project = assigns(:project)
        assert_redirected_to project_path(@project)
      end
      
      def user.join_project
        assert_difference('ProjectMembership.count') do
          post project_project_memberships_path(@project),:project_membership => {:project_id => @project.id, :user_id => users(:usr1).id, :joined => Date.today}
        end
        assert_redirected_to project_project_membership_path(assigns(:project_membership).project,assigns(:project_membership))
      end
      def user.list_projects_again
        list_projects
        assert_tag :a, :attributes => {:href => new_user_time_log_path(users(:usr1),:project_id => @project.id)}, :content => "Registrar Horas"
      end
    end
  end
end
