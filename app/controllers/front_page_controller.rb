class FrontPageController < ApplicationController
  layout 'application'
  caches_page :show, :index

  def index # TODO: clean this hack for caching
    @public_surveys = Survey.find_public
    render :action => :show
  end 

  def show
    @public_surveys = Survey.find_public
  end

end
