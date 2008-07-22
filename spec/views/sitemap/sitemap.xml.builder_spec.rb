require File.dirname(__FILE__) + '/../../spec_helper'

describe "/sitemap/sitemap.xml.builder" do
  before(:each) do
    @stage1 = mock_model(Stage, :title => "Contact Details", :updated_at => Time.now )
    @stage2 = mock_model(Stage, :title => "Farm Details", :updated_at => Time.now  )
    @stages = [@stage1, @stage2]
    assigns[:stages] = @stages
    render '/sitemap/sitemap.xml.builder'
  end
  
  it "should have loc tags for each stage and a lastmod" do
    response.should have_tag('loc', /stages\/(\d+)/) #TODO check how to test the fully qualified url
    response.should have_tag('loc', /stages\/(\d+)/)
    response.should have_tag('lastmod')
    response.should have_tag('lastmod')
  end
end
