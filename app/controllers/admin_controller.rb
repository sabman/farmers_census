class AdminController < ApplicationController
  before_filter :verify_admin
  layout "admin"

  def index
  end

end
