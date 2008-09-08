class NominationsController < ApplicationController
  before_filter :verify_admin, :except => [:new, :create]
  
  # GET /nominations
  # GET /nominations.xml
  def index
    @nominations = Nomination.paginate(:all, :page => params[:page], :per_page => 30)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @nominations }
    end
  end

  # GET /nominations/1
  # GET /nominations/1.xml
  def show
    @nomination = Nomination.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @nomination }
    end
  end

  # GET /nominations/new
  # GET /nominations/new.xml
  def new
    @nomination = Nomination.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @nomination }
    end
  end

  # GET /nominations/1/edit
  def edit
    @nomination = Nomination.find(params[:id])
  end

  # POST /nominations
  # POST /nominations.xml
  def create
    @nomination = Nomination.new(params[:nomination])

    respond_to do |format|
      if @nomination.save
        AdminMailer.deliver_nomination_notification(@nomination, request.host_with_port) 
        flash[:notice] = "#{@nomination.your_name}, thank you for the nomination."
        format.html { redirect_to(home_path) }
        format.xml  { render :xml => @nomination, :status => :created, :location => @nomination }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @nomination.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /nominations/1
  # PUT /nominations/1.xml
  def update
    @nomination = Nomination.find(params[:id])

    respond_to do |format|
      if @nomination.update_attributes(params[:nomination])
        flash[:notice] = 'Nomination was successfully updated.'
        format.html { redirect_to(@nomination) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @nomination.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /nominations/1
  # DELETE /nominations/1.xml
  def destroy
    @nomination = Nomination.find(params[:id])
    @nomination.destroy

    respond_to do |format|
      format.html { redirect_to(nominations_url) }
      format.xml  { head :ok }
    end
  end
end
