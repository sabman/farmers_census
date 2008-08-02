class SessionsController < ApplicationController
  # render new.rhtml
  def new
  end

  def create
    session[:admin_password] = params[:admin_password]
    if admin?
      redirect_to(surveys_path)
    else
      flash[:notice] = "That password was incorrect"
      redirect_to(login_path)
    end
  end

  def destroy
    session[:admin_password] = nil
    flash[:notice] = "You have been logged out."
    redirect_back_or_default('/')
  end
end
