require File.dirname(__FILE__) + '/../spec_helper'

describe FarmersController do
  describe "handling GET /farmers" do

    before(:each) do
      @farmer = mock_model(Farmer)
      Farmer.stub!(:find).and_return([@farmer])
    end
  
    def do_get
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should render index template" do
      do_get
      response.should render_template('index')
    end
  
    it "should find all farmers" do
      Farmer.should_receive(:find).with(:all).and_return([@farmer])
      do_get
    end
  
    it "should assign the found farmers for the view" do
      do_get
      assigns[:farmers].should == [@farmer]
    end
  end

  describe "handling GET /farmers.xml" do

    before(:each) do
      @farmer = mock_model(Farmer, :to_xml => "XML")
      Farmer.stub!(:find).and_return(@farmer)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all farmers" do
      Farmer.should_receive(:find).with(:all).and_return([@farmer])
      do_get
    end
  
    it "should render the found farmers as xml" do
      @farmer.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /farmers/1" do

    before(:each) do
      @farmer = mock_model(Farmer)
      Farmer.stub!(:find).and_return(@farmer)
    end
  
    def do_get
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render show template" do
      do_get
      response.should render_template('show')
    end
  
    it "should find the farmer requested" do
      Farmer.should_receive(:find).with("1").and_return(@farmer)
      do_get
    end
  
    it "should assign the found farmer for the view" do
      do_get
      assigns[:farmer].should equal(@farmer)
    end
  end

  describe "handling GET /farmers/1.xml" do

    before(:each) do
      @farmer = mock_model(Farmer, :to_xml => "XML")
      Farmer.stub!(:find).and_return(@farmer)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the farmer requested" do
      Farmer.should_receive(:find).with("1").and_return(@farmer)
      do_get
    end
  
    it "should render the found farmer as xml" do
      @farmer.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /farmers/new" do

    before(:each) do
      @farmer = mock_model(Farmer)
      Farmer.stub!(:new).and_return(@farmer)
    end
  
    def do_get
      get :new
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render new template" do
      do_get
      response.should render_template('new')
    end
  
    it "should create an new farmer" do
      Farmer.should_receive(:new).and_return(@farmer)
      do_get
    end
  
    it "should not save the new farmer" do
      @farmer.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new farmer for the view" do
      do_get
      assigns[:farmer].should equal(@farmer)
    end
  end

  describe "handling GET /farmers/1/edit" do

    before(:each) do
      @farmer = mock_model(Farmer)
      Farmer.stub!(:find).and_return(@farmer)
    end
  
    def do_get
      get :edit, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render edit template" do
      do_get
      response.should render_template('edit')
    end
  
    it "should find the farmer requested" do
      Farmer.should_receive(:find).and_return(@farmer)
      do_get
    end
  
    it "should assign the found Farmer for the view" do
      do_get
      assigns[:farmer].should equal(@farmer)
    end
  end

  describe "handling POST /farmers" do

    before(:each) do
      @farmer = mock_model(Farmer, :to_param => "1")
      Farmer.stub!(:new).and_return(@farmer)
    end
    
    describe "with successful save" do
  
      def do_post
        @farmer.should_receive(:save).and_return(true)
        post :create, :farmer => {}
      end
  
      it "should create a new farmer" do
        Farmer.should_receive(:new).with({}).and_return(@farmer)
        do_post
      end

      it "should redirect to the new farmer" do
        do_post
        response.should redirect_to(farmer_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @farmer.should_receive(:save).and_return(false)
        post :create, :farmer => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /farmers/1" do

    before(:each) do
      @farmer = mock_model(Farmer, :to_param => "1")
      Farmer.stub!(:find).and_return(@farmer)
    end
    
    describe "with successful update" do

      def do_put
        @farmer.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the farmer requested" do
        Farmer.should_receive(:find).with("1").and_return(@farmer)
        do_put
      end

      it "should update the found farmer" do
        do_put
        assigns(:farmer).should equal(@farmer)
      end

      it "should assign the found farmer for the view" do
        do_put
        assigns(:farmer).should equal(@farmer)
      end

      it "should redirect to the farmer" do
        do_put
        response.should redirect_to(farmer_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @farmer.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /farmers/1" do

    before(:each) do
      @farmer = mock_model(Farmer, :destroy => true)
      Farmer.stub!(:find).and_return(@farmer)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the farmer requested" do
      Farmer.should_receive(:find).with("1").and_return(@farmer)
      do_delete
    end
  
    it "should call destroy on the found farmer" do
      @farmer.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the farmers list" do
      do_delete
      response.should redirect_to(farmers_url)
    end
  end
end