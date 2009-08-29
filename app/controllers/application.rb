# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  before_filter :login_required
  before_filter :setup_current_user
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'b5e8d94b8213dd0e8f004da538a881d1'

  # See ActionController::Base for details
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password").
  # filter_parameter_logging :password
  private
  def authorized?
    session[:user_id] || controller_name=="sessions"
  end

  def login_required
    authorized? || access_denied
  end

  def access_denied
    respond_to do |format|
      format.html do
        session[:return_to] = request.request_uri
        redirect_to new_session_path
      end
    end
  end
  def setup_current_user
    if session[:user_id]
      @current_user = User.find session[:user_id]
    end
    true
  end
end

