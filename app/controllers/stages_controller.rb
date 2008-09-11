class StagesController < ApplicationController
  include GeoKit::Geocoders
  before_filter :verify_survey  
    
  # GET /stages
  # GET /stages.xml
  def index
    @stages = Stage.find(:all)
    @avatar = Avatar.new   
    @current_survey = current_survey
    
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /stages/1
  def show
    @stage = Stage.find(params[:id])
    @avatar = Avatar.new   
    @questions = @stage.questions
    @prev_stage = @stage.previous 
    @next_stage = @stage.next 
    @answers = current_survey.answers.find_all_by_stage_id(@stage.id)
    @current_survey = current_survey
    
    respond_to do |format|
      format.html # show.html.erb
    end
  end


  # PUT /stages/1
  # PUT /stages/1.xml
  def update
    @stage = Stage.find(params[:id])
    if params[:next] == 'next'
      @stage = @stage.next
    elsif params[:next] == 'previous'
      @stage = @stage.previous
    end

		if params[:avatar]
		  unless(params[:avatar][:uploaded_data]=="")    
  	    if @avatar = Avatar.create(params[:avatar])
  	      current_survey.avatars << @avatar
	      end
		  end                  
		end

    current_survey.update_attributes(params[:survey])
    
    respond_to do |format|
      if @stage.update_attributes(params[:stage])
        format.html { 
          params[:next] == 'last' ? redirect_to(stages_url) : redirect_to(@stage) 
        }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /stages/1
  # DELETE /stages/1.xml
  def destroy
    @stage = Stage.find(params[:id])
    @stage.destroy

    respond_to do |format|
      format.html { redirect_to(stages_url) }
    end
  end

  def validate_address 
    @current_survey = current_survey  
    @loc = MultiGeocoder.geocode(params[:address]) 
    #TODO: refactor this to get everything related to creating the view out of the action
    @map = Variable.new("map")
    @marker = Variable.new("marker")
    @center = GLatLng.new([@loc.lat,@loc.lng])
    @zoom = 14
    icon_standard = Variable.new("icon_standard")
    @marker = GMarker.new(@center,:icon => icon_standard,
              :info_window => "<div id='standard_info_window'>#{@loc.full_address}</div>",
              :title => @loc.full_address, :max_width => 200, 
              :draggable => true, :bouncy => true)
  end
  
  def done    
    @current_survey = current_survey 
    redirect_to(home_path)
    AdminMailer.deliver_survey_notification(current_survey, request.host_with_port)
    session[:current_survey] = nil
  end     
  
  private

  # check if there is already a survey in progress
  def verify_survey
    if current_survey  
      return
    else      
      redirect_to(new_survey_path)
    end
  end
  
end
