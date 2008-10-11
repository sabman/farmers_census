class SessionsController < ApplicationController
  layout "admin"
  
  cache_sweeper :page_sweeper,    :only => [:destroy] 
  cache_sweeper :survey_sweeper,  :only => [:destroy] 
  
  
  # render new.rhtml
  def new
  end

  def create
    session[:admin_password] = params[:admin_password]
    if admin?
      redirect_back_or_default('/admin')
    else
      flash[:notice] = "That password was incorrect"
      redirect_to(login_path)
    end
  end

  def destroy
    (0..Survey.count-1).each do |i|
      expire_page( :controller => 'surveys', :action => 'show', :id => i ) 
    end    
    session[:admin_password] = nil
    flash[:notice] = "You have been logged out."
    redirect_back_or_default('/')
  end
end
