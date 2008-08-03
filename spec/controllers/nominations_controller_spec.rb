require File.dirname(__FILE__) + '/../spec_helper'

describe NominationsController do
  describe "handling GET /nominations" do

    before(:each) do
      @nomination = mock_model(Nomination)
      Nomination.stub!(:find).and_return([@nomination])
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
  
    it "should find all nominations" do
      Nomination.should_receive(:find).with(:all).and_return([@nomination])
      do_get
    end
  
    it "should assign the found nominations for the view" do
      do_get
      assigns[:nominations].should == [@nomination]
    end
  end

  describe "handling GET /nominations.xml" do

    before(:each) do
      @nomination = mock_model(Nomination, :to_xml => "XML")
      Nomination.stub!(:find).and_return(@nomination)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all nominations" do
      Nomination.should_receive(:find).with(:all).and_return([@nomination])
      do_get
    end
  
    it "should render the found nominations as xml" do
      @nomination.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /nominations/1" do

    before(:each) do
      @nomination = mock_model(Nomination)
      Nomination.stub!(:find).and_return(@nomination)
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
  
    it "should find the nomination requested" do
      Nomination.should_receive(:find).with("1").and_return(@nomination)
      do_get
    end
  
    it "should assign the found nomination for the view" do
      do_get
      assigns[:nomination].should equal(@nomination)
    end
  end

  describe "handling GET /nominations/1.xml" do

    before(:each) do
      @nomination = mock_model(Nomination, :to_xml => "XML")
      Nomination.stub!(:find).and_return(@nomination)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the nomination requested" do
      Nomination.should_receive(:find).with("1").and_return(@nomination)
      do_get
    end
  
    it "should render the found nomination as xml" do
      @nomination.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /nominations/new" do

    before(:each) do
      @nomination = mock_model(Nomination)
      Nomination.stub!(:new).and_return(@nomination)
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
  
    it "should create an new nomination" do
      Nomination.should_receive(:new).and_return(@nomination)
      do_get
    end
  
    it "should not save the new nomination" do
      @nomination.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new nomination for the view" do
      do_get
      assigns[:nomination].should equal(@nomination)
    end
  end

  describe "handling GET /nominations/1/edit" do

    before(:each) do
      @nomination = mock_model(Nomination)
      Nomination.stub!(:find).and_return(@nomination)
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
  
    it "should find the nomination requested" do
      Nomination.should_receive(:find).and_return(@nomination)
      do_get
    end
  
    it "should assign the found Nomination for the view" do
      do_get
      assigns[:nomination].should equal(@nomination)
    end
  end

  describe "handling POST /nominations" do

    before(:each) do
      @nomination = mock_model(Nomination, :to_param => "1")
      Nomination.stub!(:new).and_return(@nomination)
    end
    
    describe "with successful save" do
  
      def do_post
        @nomination.should_receive(:save).and_return(true)
        post :create, :nomination => {}
      end
  
      it "should create a new nomination" do
        Nomination.should_receive(:new).with({}).and_return(@nomination)
        do_post
      end

      it "should redirect to the new nomination" do
        do_post
        response.should redirect_to(nomination_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @nomination.should_receive(:save).and_return(false)
        post :create, :nomination => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /nominations/1" do

    before(:each) do
      @nomination = mock_model(Nomination, :to_param => "1")
      Nomination.stub!(:find).and_return(@nomination)
    end
    
    describe "with successful update" do

      def do_put
        @nomination.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the nomination requested" do
        Nomination.should_receive(:find).with("1").and_return(@nomination)
        do_put
      end

      it "should update the found nomination" do
        do_put
        assigns(:nomination).should equal(@nomination)
      end

      it "should assign the found nomination for the view" do
        do_put
        assigns(:nomination).should equal(@nomination)
      end

      it "should redirect to the nomination" do
        do_put
        response.should redirect_to(nomination_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @nomination.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /nominations/1" do

    before(:each) do
      @nomination = mock_model(Nomination, :destroy => true)
      Nomination.stub!(:find).and_return(@nomination)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the nomination requested" do
      Nomination.should_receive(:find).with("1").and_return(@nomination)
      do_delete
    end
  
    it "should call destroy on the found nomination" do
      @nomination.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the nominations list" do
      do_delete
      response.should redirect_to(nominations_url)
    end
  end
end