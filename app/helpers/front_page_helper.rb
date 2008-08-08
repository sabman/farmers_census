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
    coords = (coords.length == 0) ? [[-121.640625,26.431228],[-68.554687,47.15984]] : coords # if there are no records just zoom/center over 0,0      
   # bnd = MultiPoint.from_coordinates(coords).envelope
   # @map.center_zoom_on_bounds_init([[bnd.lower_corner.y,bnd.lower_corner.x],[bnd.upper_corner.y,bnd.upper_corner.x]])
    @map.center_zoom_init([39.5,-97],4)   
    
    @map.record_init '    
    // Rectangle Overlay
    var rectBounds = new GLatLngBounds(new GLatLng(-40, -179), new GLatLng(80,-1));
    var rectOverlay = new Rectangle(rectBounds);
    map.addOverlay(rectOverlay); 
    rectOverlay.hide();   
    
    // create the bottom left/top right coord for the overlay and add it as a 
  	// GGroundOverlay pinning it to those bbox coords
  	// MAP_DETAILED.JPG
  	var boundaries1 = new GLatLngBounds(
  			new GLatLng(22.727,-127.594), new GLatLng(56.417,-64.563));	
  	var mapDetailedOverlay = new GGroundOverlay("/images/handdrawn/map_detailed.jpg", boundaries1);  																					
    mapDetailedOverlay.hide();																					
  	map.addOverlay(mapDetailedOverlay); 

  	// MAP_SMALL.JPG
  	var boundaries2 = new GLatLngBounds(
  			new GLatLng(20.64,-127.57), new GLatLng(54.48,-64.42));	
  	var mapSmallOverlay = new GGroundOverlay("/images/handdrawn/map_small.jpg", boundaries2);  																					
    //mapDetailedOverlay.hide();																					
  	map.addOverlay(mapSmallOverlay); 
               
  	// MAP_LARGE.JPG
  	var boundaries3 = new GLatLngBounds(
  	 		new GLatLng(21.166,-125.606), new GLatLng(53.181,-62.484));	  	 
    var mapLargeOverlay = new GGroundOverlay("/images/handdrawn/map_large.jpg", boundaries3);  
    mapLargeOverlay.hide();																					
 	  map.addOverlay(mapLargeOverlay);
 	     
  	GEvent.addListener(map, "zoomend", function(oldz, newz){
  		if(newz < 3) { // 0-3-4 show only mapLargeOverlay  
  			if(rectOverlay.isHidden()){rectOverlay.show();}
  			if(mapLargeOverlay.isHidden()){mapLargeOverlay.show();}
  	    if(!mapSmallOverlay.isHidden()){mapSmallOverlay.hide();}
        if(!mapDetailedOverlay.isHidden()){ mapDetailedOverlay.hide();}   
  		} 
  		else if(newz < 5) { // 3-4 show only mapSmallOverlay and rectOverlay 
  			if(!mapLargeOverlay.isHidden()){mapLargeOverlay.hide();}
  			if(!mapDetailedOverlay.isHidden()){mapDetailedOverlay.hide();}
    	  if(rectOverlay.isHidden()){rectOverlay.show();}
  			if(mapSmallOverlay.isHidden()){mapSmallOverlay.show();}
  		} 
  		else if(newz >= 5 && newz <= 7) { // 5-7 only show mapDetailedOverlay  
  			if(!rectOverlay.isHidden()){rectOverlay.hide();}
   			if(mapDetailedOverlay.isHidden()){ mapDetailedOverlay.show();}
   			if(!mapLargeOverlay.isHidden()){mapLargeOverlay.hide();}
    	  if(!mapSmallOverlay.isHidden()){mapSmallOverlay.hide();}   			  
  		} 
  		else { // for everything else no overlays
  			if(!rectOverlay.isHidden()){rectOverlay.hide();}
   			if(!mapDetailedOverlay.isHidden()){ mapDetailedOverlay.hide();}
  			if(!mapLargeOverlay.isHidden()){mapLargeOverlay.hide();}
    	  if(!mapSmallOverlay.isHidden()){mapSmallOverlay.hide();}
  		}}); '
  	
    @map.to_html 
  end
end
