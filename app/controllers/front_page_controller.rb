class FrontPageController < ApplicationController
  layout 'application'
  caches_page :show, :index

  def index # TODO: clean this hack for caching
    @public_surveys = Survey.find_public
    # if current_survey 
    #   flash[:notice] = "#{survey in progress ... link_to 'continue' , stages_path}"
    # end
    render :action => :show
  end 

  def show
    @public_surveys = Survey.find_public
  end

end
