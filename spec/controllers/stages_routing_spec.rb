require File.dirname(__FILE__) + '/../spec_helper'

describe StagesController do
  describe "route generation" do

    it "should map { :controller => 'stages', :action => 'index' } to /stages" do
      route_for(:controller => "stages", :action => "index").should == "/stages"
    end
  
    it "should map { :controller => 'stages', :action => 'new' } to /stages/new" do
      route_for(:controller => "stages", :action => "new").should == "/stages/new"
    end
  
    it "should map { :controller => 'stages', :action => 'show', :id => 1 } to /stages/1" do
      route_for(:controller => "stages", :action => "show", :id => 1).should == "/stages/1"
    end
  
    it "should map { :controller => 'stages', :action => 'edit', :id => 1 } to /stages/1/edit" do
      route_for(:controller => "stages", :action => "edit", :id => 1).should == "/stages/1/edit"
    end
  
    it "should map { :controller => 'stages', :action => 'update', :id => 1} to /stages/1" do
      route_for(:controller => "stages", :action => "update", :id => 1).should == "/stages/1"
    end
  
    it "should map { :controller => 'stages', :action => 'destroy', :id => 1} to /stages/1" do
      route_for(:controller => "stages", :action => "destroy", :id => 1).should == "/stages/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'stages', action => 'index' } from GET /stages" do
      params_from(:get, "/stages").should == {:controller => "stages", :action => "index"}
    end
  
    it "should generate params { :controller => 'stages', action => 'new' } from GET /stages/new" do
      params_from(:get, "/stages/new").should == {:controller => "stages", :action => "new"}
    end
  
    it "should generate params { :controller => 'stages', action => 'create' } from POST /stages" do
      params_from(:post, "/stages").should == {:controller => "stages", :action => "create"}
    end
  
    it "should generate params { :controller => 'stages', action => 'show', id => '1' } from GET /stages/1" do
      params_from(:get, "/stages/1").should == {:controller => "stages", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'stages', action => 'edit', id => '1' } from GET /stages/1;edit" do
      params_from(:get, "/stages/1/edit").should == {:controller => "stages", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'stages', action => 'update', id => '1' } from PUT /stages/1" do
      params_from(:put, "/stages/1").should == {:controller => "stages", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'stages', action => 'destroy', id => '1' } from DELETE /stages/1" do
      params_from(:delete, "/stages/1").should == {:controller => "stages", :action => "destroy", :id => "1"}
    end
  end
end