class FarmersController < ApplicationController
  before_filter :verify_admin
  # GET /farmers
  # GET /farmers.xml
  def index
    @farmers = Farmer.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @farmers }
    end
  end

  # GET /farmers/1
  # GET /farmers/1.xml
  def show
    @farmer = Farmer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @farmer }
    end
  end

  # GET /farmers/new
  # GET /farmers/new.xml
  def new
    @farmer = Farmer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @farmer }
    end
  end

  # GET /farmers/1/edit
  def edit
    @farmer = Farmer.find(params[:id])
  end

  # POST /farmers
  # POST /farmers.xml
  def create
    @farmer = Farmer.new(params[:farmer])

    respond_to do |format|
      if @farmer.save
        flash[:notice] = 'Farmer was successfully created.'
        format.html { redirect_to(@farmer) }
        format.xml  { render :xml => @farmer, :status => :created, :location => @farmer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @farmer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /farmers/1
  # PUT /farmers/1.xml
  def update
    @farmer = Farmer.find(params[:id])

    respond_to do |format|
      if @farmer.update_attributes(params[:farmer])
        flash[:notice] = 'Farmer was successfully updated.'
        format.html { redirect_to(@farmer) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @farmer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /farmers/1
  # DELETE /farmers/1.xml
  def destroy
    @farmer = Farmer.find(params[:id])
    @farmer.destroy

    respond_to do |format|
      format.html { redirect_to(farmers_url) }
      format.xml  { head :ok }
    end
  end
end
