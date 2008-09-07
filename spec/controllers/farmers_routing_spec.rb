require File.dirname(__FILE__) + '/../spec_helper'

describe FarmersController do
  describe "route generation" do

    it "should map { :controller => 'farmers', :action => 'index' } to /farmers" do
      route_for(:controller => "farmers", :action => "index").should == "/farmers"
    end
  
    it "should map { :controller => 'farmers', :action => 'new' } to /farmers/new" do
      route_for(:controller => "farmers", :action => "new").should == "/farmers/new"
    end
  
    it "should map { :controller => 'farmers', :action => 'show', :id => 1 } to /farmers/1" do
      route_for(:controller => "farmers", :action => "show", :id => 1).should == "/farmers/1"
    end
  
    it "should map { :controller => 'farmers', :action => 'edit', :id => 1 } to /farmers/1/edit" do
      route_for(:controller => "farmers", :action => "edit", :id => 1).should == "/farmers/1/edit"
    end
  
    it "should map { :controller => 'farmers', :action => 'update', :id => 1} to /farmers/1" do
      route_for(:controller => "farmers", :action => "update", :id => 1).should == "/farmers/1"
    end
  
    it "should map { :controller => 'farmers', :action => 'destroy', :id => 1} to /farmers/1" do
      route_for(:controller => "farmers", :action => "destroy", :id => 1).should == "/farmers/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'farmers', action => 'index' } from GET /farmers" do
      params_from(:get, "/farmers").should == {:controller => "farmers", :action => "index"}
    end
  
    it "should generate params { :controller => 'farmers', action => 'new' } from GET /farmers/new" do
      params_from(:get, "/farmers/new").should == {:controller => "farmers", :action => "new"}
    end
  
    it "should generate params { :controller => 'farmers', action => 'create' } from POST /farmers" do
      params_from(:post, "/farmers").should == {:controller => "farmers", :action => "create"}
    end
  
    it "should generate params { :controller => 'farmers', action => 'show', id => '1' } from GET /farmers/1" do
      params_from(:get, "/farmers/1").should == {:controller => "farmers", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'farmers', action => 'edit', id => '1' } from GET /farmers/1;edit" do
      params_from(:get, "/farmers/1/edit").should == {:controller => "farmers", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'farmers', action => 'update', id => '1' } from PUT /farmers/1" do
      params_from(:put, "/farmers/1").should == {:controller => "farmers", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'farmers', action => 'destroy', id => '1' } from DELETE /farmers/1" do
      params_from(:delete, "/farmers/1").should == {:controller => "farmers", :action => "destroy", :id => "1"}
    end
  end
end