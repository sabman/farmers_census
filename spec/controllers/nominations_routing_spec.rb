require File.dirname(__FILE__) + '/../spec_helper'

describe NominationsController do
  describe "route generation" do

    it "should map { :controller => 'nominations', :action => 'index' } to /nominations" do
      route_for(:controller => "nominations", :action => "index").should == "/nominations"
    end
  
    it "should map { :controller => 'nominations', :action => 'new' } to /nominations/new" do
      route_for(:controller => "nominations", :action => "new").should == "/nominations/new"
    end
  
    it "should map { :controller => 'nominations', :action => 'show', :id => 1 } to /nominations/1" do
      route_for(:controller => "nominations", :action => "show", :id => 1).should == "/nominations/1"
    end
  
    it "should map { :controller => 'nominations', :action => 'edit', :id => 1 } to /nominations/1/edit" do
      route_for(:controller => "nominations", :action => "edit", :id => 1).should == "/nominations/1/edit"
    end
  
    it "should map { :controller => 'nominations', :action => 'update', :id => 1} to /nominations/1" do
      route_for(:controller => "nominations", :action => "update", :id => 1).should == "/nominations/1"
    end
  
    it "should map { :controller => 'nominations', :action => 'destroy', :id => 1} to /nominations/1" do
      route_for(:controller => "nominations", :action => "destroy", :id => 1).should == "/nominations/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'nominations', action => 'index' } from GET /nominations" do
      params_from(:get, "/nominations").should == {:controller => "nominations", :action => "index"}
    end
  
    it "should generate params { :controller => 'nominations', action => 'new' } from GET /nominations/new" do
      params_from(:get, "/nominations/new").should == {:controller => "nominations", :action => "new"}
    end
  
    it "should generate params { :controller => 'nominations', action => 'create' } from POST /nominations" do
      params_from(:post, "/nominations").should == {:controller => "nominations", :action => "create"}
    end
  
    it "should generate params { :controller => 'nominations', action => 'show', id => '1' } from GET /nominations/1" do
      params_from(:get, "/nominations/1").should == {:controller => "nominations", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'nominations', action => 'edit', id => '1' } from GET /nominations/1;edit" do
      params_from(:get, "/nominations/1/edit").should == {:controller => "nominations", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'nominations', action => 'update', id => '1' } from PUT /nominations/1" do
      params_from(:put, "/nominations/1").should == {:controller => "nominations", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'nominations', action => 'destroy', id => '1' } from DELETE /nominations/1" do
      params_from(:delete, "/nominations/1").should == {:controller => "nominations", :action => "destroy", :id => "1"}
    end
  end
end