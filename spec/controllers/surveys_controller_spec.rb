require File.dirname(__FILE__) + '/../spec_helper'

describe SurveysController do
  describe "handling GET /surveys" do

    before(:each) do
      @survey = mock_model(Survey)
      Survey.stub!(:find).and_return([@survey])
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
  
    it "should find all surveys" do
      Survey.should_receive(:find).with(:all).and_return([@survey])
      do_get
    end
  
    it "should assign the found surveys for the view" do
      do_get
      assigns[:surveys].should == [@survey]
    end
  end

  describe "handling GET /surveys.xml" do

    before(:each) do
      @survey = mock_model(Survey, :to_xml => "XML")
      Survey.stub!(:find).and_return(@survey)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all surveys" do
      Survey.should_receive(:find).with(:all).and_return([@survey])
      do_get
    end
  
    it "should render the found surveys as xml" do
      @survey.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /surveys/1" do

    before(:each) do
      @survey = mock_model(Survey)
      Survey.stub!(:find).and_return(@survey)
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
  
    it "should find the survey requested" do
      Survey.should_receive(:find).with("1").and_return(@survey)
      do_get
    end
  
    it "should assign the found survey for the view" do
      do_get
      assigns[:survey].should equal(@survey)
    end
  end

  describe "handling GET /surveys/1.xml" do

    before(:each) do
      @survey = mock_model(Survey, :to_xml => "XML")
      Survey.stub!(:find).and_return(@survey)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the survey requested" do
      Survey.should_receive(:find).with("1").and_return(@survey)
      do_get
    end
  
    it "should render the found survey as xml" do
      @survey.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /surveys/new" do

    before(:each) do
      @survey = mock_model(Survey)
      Survey.stub!(:new).and_return(@survey)
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
  
    it "should create an new survey" do
      Survey.should_receive(:new).and_return(@survey)
      do_get
    end
  
    it "should not save the new survey" do
      @survey.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new survey for the view" do
      do_get
      assigns[:survey].should equal(@survey)
    end
  end

  describe "handling GET /surveys/1/edit" do

    before(:each) do
      @survey = mock_model(Survey)
      Survey.stub!(:find).and_return(@survey)
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
  
    it "should find the survey requested" do
      Survey.should_receive(:find).and_return(@survey)
      do_get
    end
  
    it "should assign the found Survey for the view" do
      do_get
      assigns[:survey].should equal(@survey)
    end
  end

  describe "handling POST /surveys" do

    before(:each) do
      @survey = mock_model(Survey, :to_param => "1")
      Survey.stub!(:new).and_return(@survey)
    end
    
    describe "with successful save" do
  
      def do_post
        @survey.should_receive(:save).and_return(true)
        post :create, :survey => {}
      end
  
      it "should create a new survey" do
        Survey.should_receive(:new).with({}).and_return(@survey)
        do_post
      end

      it "should redirect to the new survey" do
        do_post
        response.should redirect_to(survey_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @survey.should_receive(:save).and_return(false)
        post :create, :survey => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /surveys/1" do

    before(:each) do
      @survey = mock_model(Survey, :to_param => "1")
      Survey.stub!(:find).and_return(@survey)
    end
    
    describe "with successful update" do

      def do_put
        @survey.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the survey requested" do
        Survey.should_receive(:find).with("1").and_return(@survey)
        do_put
      end

      it "should update the found survey" do
        do_put
        assigns(:survey).should equal(@survey)
      end

      it "should assign the found survey for the view" do
        do_put
        assigns(:survey).should equal(@survey)
      end

      it "should redirect to the survey" do
        do_put
        response.should redirect_to(survey_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @survey.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /surveys/1" do

    before(:each) do
      @survey = mock_model(Survey, :destroy => true)
      Survey.stub!(:find).and_return(@survey)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the survey requested" do
      Survey.should_receive(:find).with("1").and_return(@survey)
      do_delete
    end
  
    it "should call destroy on the found survey" do
      @survey.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the surveys list" do
      do_delete
      response.should redirect_to(surveys_url)
    end
  end
end