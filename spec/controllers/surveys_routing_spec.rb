require File.dirname(__FILE__) + '/../spec_helper'

describe SurveysController do
  describe "route generation" do

    it "should map { :controller => 'surveys', :action => 'index' } to /surveys" do
      route_for(:controller => "surveys", :action => "index").should == "/surveys"
    end
  
    it "should map { :controller => 'surveys', :action => 'new' } to /surveys/new" do
      route_for(:controller => "surveys", :action => "new").should == "/surveys/new"
    end
  
    it "should map { :controller => 'surveys', :action => 'show', :id => 1 } to /surveys/1" do
      route_for(:controller => "surveys", :action => "show", :id => 1).should == "/surveys/1"
    end
  
    it "should map { :controller => 'surveys', :action => 'edit', :id => 1 } to /surveys/1/edit" do
      route_for(:controller => "surveys", :action => "edit", :id => 1).should == "/surveys/1/edit"
    end
  
    it "should map { :controller => 'surveys', :action => 'update', :id => 1} to /surveys/1" do
      route_for(:controller => "surveys", :action => "update", :id => 1).should == "/surveys/1"
    end
  
    it "should map { :controller => 'surveys', :action => 'destroy', :id => 1} to /surveys/1" do
      route_for(:controller => "surveys", :action => "destroy", :id => 1).should == "/surveys/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'surveys', action => 'index' } from GET /surveys" do
      params_from(:get, "/surveys").should == {:controller => "surveys", :action => "index"}
    end
  
    it "should generate params { :controller => 'surveys', action => 'new' } from GET /surveys/new" do
      params_from(:get, "/surveys/new").should == {:controller => "surveys", :action => "new"}
    end
  
    it "should generate params { :controller => 'surveys', action => 'create' } from POST /surveys" do
      params_from(:post, "/surveys").should == {:controller => "surveys", :action => "create"}
    end
  
    it "should generate params { :controller => 'surveys', action => 'show', id => '1' } from GET /surveys/1" do
      params_from(:get, "/surveys/1").should == {:controller => "surveys", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'surveys', action => 'edit', id => '1' } from GET /surveys/1;edit" do
      params_from(:get, "/surveys/1/edit").should == {:controller => "surveys", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'surveys', action => 'update', id => '1' } from PUT /surveys/1" do
      params_from(:put, "/surveys/1").should == {:controller => "surveys", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'surveys', action => 'destroy', id => '1' } from DELETE /surveys/1" do
      params_from(:delete, "/surveys/1").should == {:controller => "surveys", :action => "destroy", :id => "1"}
    end
  end
end