require File.dirname(__FILE__) + '/../spec_helper'

describe StagesController do
  describe "handling GET /stages" do

    before(:each) do
      @stage = mock_model(Stage)
      Stage.stub!(:find).and_return([@stage])
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
  
    it "should find all stages" do
      Stage.should_receive(:find).with(:all).and_return([@stage])
      do_get
    end
  
    it "should assign the found stages for the view" do
      do_get
      assigns[:stages].should == [@stage]
    end
  end

  describe "handling GET /stages.xml" do

    before(:each) do
      @stage = mock_model(Stage, :to_xml => "XML")
      Stage.stub!(:find).and_return(@stage)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all stages" do
      Stage.should_receive(:find).with(:all).and_return([@stage])
      do_get
    end
  
    it "should render the found stages as xml" do
      @stage.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /stages/1" do

    before(:each) do
      @stage = mock_model(Stage)
      Stage.stub!(:find).and_return(@stage)
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
  
    it "should find the stage requested" do
      Stage.should_receive(:find).with("1").and_return(@stage)
      do_get
    end
  
    it "should assign the found stage for the view" do
      do_get
      assigns[:stage].should equal(@stage)
    end
  end

  describe "handling GET /stages/1.xml" do

    before(:each) do
      @stage = mock_model(Stage, :to_xml => "XML")
      Stage.stub!(:find).and_return(@stage)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the stage requested" do
      Stage.should_receive(:find).with("1").and_return(@stage)
      do_get
    end
  
    it "should render the found stage as xml" do
      @stage.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /stages/new" do

    before(:each) do
      @stage = mock_model(Stage)
      Stage.stub!(:new).and_return(@stage)
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
  
    it "should create an new stage" do
      Stage.should_receive(:new).and_return(@stage)
      do_get
    end
  
    it "should not save the new stage" do
      @stage.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new stage for the view" do
      do_get
      assigns[:stage].should equal(@stage)
    end
  end

  describe "handling GET /stages/1/edit" do

    before(:each) do
      @stage = mock_model(Stage)
      Stage.stub!(:find).and_return(@stage)
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
  
    it "should find the stage requested" do
      Stage.should_receive(:find).and_return(@stage)
      do_get
    end
  
    it "should assign the found Stage for the view" do
      do_get
      assigns[:stage].should equal(@stage)
    end
  end

  describe "handling POST /stages" do

    before(:each) do
      @stage = mock_model(Stage, :to_param => "1")
      Stage.stub!(:new).and_return(@stage)
    end
    
    describe "with successful save" do
  
      def do_post
        @stage.should_receive(:save).and_return(true)
        post :create, :stage => {}
      end
  
      it "should create a new stage" do
        Stage.should_receive(:new).with({}).and_return(@stage)
        do_post
      end

      it "should redirect to the new stage" do
        do_post
        response.should redirect_to(stage_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @stage.should_receive(:save).and_return(false)
        post :create, :stage => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /stages/1" do

    before(:each) do
      @stage = mock_model(Stage, :to_param => "1")
      Stage.stub!(:find).and_return(@stage)
    end
    
    describe "with successful update" do

      def do_put
        @stage.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the stage requested" do
        Stage.should_receive(:find).with("1").and_return(@stage)
        do_put
      end

      it "should update the found stage" do
        do_put
        assigns(:stage).should equal(@stage)
      end

      it "should assign the found stage for the view" do
        do_put
        assigns(:stage).should equal(@stage)
      end

      it "should redirect to the stage" do
        do_put
        response.should redirect_to(stage_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @stage.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /stages/1" do

    before(:each) do
      @stage = mock_model(Stage, :destroy => true)
      Stage.stub!(:find).and_return(@stage)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the stage requested" do
      Stage.should_receive(:find).with("1").and_return(@stage)
      do_delete
    end
  
    it "should call destroy on the found stage" do
      @stage.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the stages list" do
      do_delete
      response.should redirect_to(stages_url)
    end
  end
end