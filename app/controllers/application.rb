# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  helper :all # include all helpers, all the time
  helper_method :admin?

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '78b0bb4060f9cdbb728fd237faa67b67'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  def current_survey
    return nil if session[:current_survey] == nil
    current_survey = Survey.find(session[:current_survey])
    return current_survey
  end

  
  protected
  def admin?
    session[:admin_password] == Admin::PASSWORD
  end
  
  def verify_admin
    unless admin?
      redirect_to(login_path)
      return false
    end
    true
  end

end
