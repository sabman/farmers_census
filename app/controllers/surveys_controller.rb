class SurveysController < ApplicationController
  before_filter :verify_admin, :except => [:show, :new, :create, :resume, :forgotten, :reminder]
  before_filter :verify_public, :only => :show, :unless => :admin? 
  
  # GET /surveys
  def index
    @surveys = Survey.paginate(:all, :page => params[:page], :per_page => 30)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /surveys/1
  def show
    @survey = Survey.find(params[:id])
    @questions = Question.find(:all)
    @stages = Stage.find(:all)
    
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # NOTE: /surveys/new is used for the farmer to register their email address
  # so they can return to a survey
  
  # GET /surveys/new
  def new
    @survey = Survey.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # POST /surveys
  def create
    @survey = Survey.new(params[:survey])
    Question.all.each do |q|
      @survey.answers.build({:question_id => q.id, :stage_id => q.stage.id})
    end

    respond_to do |format|
      if @survey.save
        session[:current_survey]  = @survey.id
        flash[:notice]            = 'Survey was successfully created.'
        format.html { redirect_to stage_path(Stage.first) }
      else
        format.html { render :action => "new" }
      end
    end
  end
    
  # GET /surveys/resume/<key>
  def resume
    @survey = Survey.find_by_key(params[:key])
    
    respond_to do |format|
      if @survey
        session[:current_survey] = @survey.id
        format.html { redirect_to(stages_path) }
      else
        flash[:notice] = "Sorry, your survey key doesn't exist, please start again"
        redirect_to(home_path)
      end
    end
  end
  
  # GET /surveys/forgotten
  def forgotten
    respond_to do |format|
      format.html
    end
  end

  # POST /surveys/reminder
  def reminder
    @survey = Survey.first(:conditions => ['email = ?', params[:email]])
    
    respond_to do |format|
      if @survey
        AdminMailer.deliver_key_reminder(@survey, request.host_with_port)
        flash[:notice] = "An email has been sent to you with your survey link."
      else
        flash[:notice] = "No survey with your email was found. Please start a new one."
      end
      format.html { redirect_to(home_path) }
    end
  end

  # PUT /surveys/1
  def update
    @survey = Survey.find(params[:id])

    respond_to do |format|
      if @survey.update_attributes(params[:survey])
        flash[:notice] = 'Survey was successfully updated.'
        format.html { redirect_to(@survey) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /surveys/1
  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy

    respond_to do |format|
      format.html { redirect_to(surveys_url) }
    end
  end

  def toggle_public
    survey = Survey.find(params[:id])
    survey.public = survey.public? ? false : true
    survey.save
    render :nothing => true    
  end
  
  def verify_public
    Survey.find(params[:id]).public?
  end
  
end
