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
      format.xml  { render :xml => @stages }
    end
  end

  # GET /stages/1
  # GET /stages/1.xml
  def show
    @stage = Stage.find(params[:id])
    @questions = @stage.questions
    @prev_stage = @stage.previous 
    @next_stage = @stage.next 
    @answers = current_survey.answers.find_all_by_stage_id(@stage.id)
    @current_survey = current_survey
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stage }
      format.js 
    end
  end

  # GET /stages/new
  # GET /stages/new.xml
  # def new
  #   @stage = Stage.new
  # 
  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.xml  { render :xml => @stage }
  #   end
  # end   

  # GET /stages/1/edit
  # def edit
  #   @stage = Stage.find(params[:id])
  # end     

  # POST /stages
  # POST /stages.xml
  # def create
  #   @stage = Stage.new(params[:stage])
  # 
  #   respond_to do |format|
  #     if @stage.save
  #       flash[:notice] = 'Stage was successfully created.'
  #       format.html { redirect_to(@stage) }
  #       format.xml  { render :xml => @stage, :status => :created, :location => @stage }
  #     else
  #       format.html { render :action => "new" }
  #       format.xml  { render :xml => @stage.errors, :status => :unprocessable_entity }
  #     end
  #   end
  # end  

  # PUT /stages/1
  # PUT /stages/1.xml
  def update
    @stage = Stage.find(params[:id])
    if params[:next] == 'next'
      @stage = @stage.next
    elsif params[:next] == 'previous'
      @stage = @stage.previous
    end
        
    current_survey.update_attributes(params[:survey])
    
    respond_to do |format|
      if @stage.update_attributes(params[:stage])
        flash[:notice] = 'Stage was successfully updated.'
        format.html { params[:next] == 'last' ? redirect_to(stages_url) : redirect_to(@stage) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stage.errors, :status => :unprocessable_entity }
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
      format.xml  { head :ok }
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
    session[:current_survey] = nil 
    redirect_to(home_path)
  end     
  
  private
  
  def verify_survey
    if session[:current_survey] != nil    
      return
    else
      s = Survey.create
      questions = Question.find :all  
      questions.each do |question|
        a = Answer.create(:question_id => question.id, :stage_id => question.stage.id, :survey_id => s.id)
      end
      s.questions << questions
      session[:current_survey] = s.id 
      flash[:notice] = "Start taking the new census"
    end
  end
end
