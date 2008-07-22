xml.instruct!
xml.urlset :xmlns => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  @stages.each do |stage|
    xml.url do
      xml.loc stage_url(stage)
      xml.lastmod stage.updated_at.xmlschema      
    end
  end
end