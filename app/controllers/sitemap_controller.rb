class SitemapController < ApplicationController
  def sitemap
    @questions = Question.find_for_sitemap
    @stages = Stage.find(:all)
    respond_to do |wants|
      wants.xml {  }
    end
  end
end
