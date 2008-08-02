require 'rubygems'
require 'geo_ruby' 
module FrontPageHelper
  include GeoRuby::SimpleFeatures
  
  def show_maps recs
    @map = GMap.new("map_div", "map")
    @map.control_init(:small_map => true, :hierarchical_map_type => true)
    @map.record_init @map.add_map_type(GMapType::G_PHYSICAL_MAP)    
    @map.set_map_type_init(GMapType::G_PHYSICAL_MAP)
    coords = [] 
    recs.each do |rec|
      unless rec.lng == nil or rec.lat == nil
        coords << [rec.lng.to_f, rec.lat.to_f] 
        @map.record_init @map.add_overlay( 
          GMarker.new([rec.lat.to_f, rec.lng.to_f], 
            :title => "[TITLE]",
            :info_window => "[DESCRIPTION]" ))                
       end
    end
    coords = (coords.length == 0) ? [[-45,-45],[45,45]] : coords # if there are no records just zoom/center over 0,0     
    bnd = MultiPoint.from_coordinates(coords).envelope
    @map.center_zoom_on_bounds_init([[bnd.lower_corner.y,bnd.lower_corner.x],[bnd.upper_corner.y,bnd.upper_corner.x]])
    @map.to_html 
  end
end
