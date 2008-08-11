require 'rubygems'
require 'geo_ruby' 
module FrontPageHelper
  include GeoRuby::SimpleFeatures
  
  def show_maps recs
    @map = GMap.new("map_div", "map")
    @map.control_init(:small_map => true, :map_type => false)
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
    @map.center_zoom_init([34.5,-97.6],4)   
    
    @map.record_init( '      

 
    // remove copyright
    map.removeMapType(G_NORMAL_MAP);
    map.removeMapType(G_SATELLITE_MAP);
    var myCopyright = new GCopyrightCollection("© ");
    myCopyright.addCopyright(new GCopyright(\'Greenhorns\',
      new GLatLngBounds(new GLatLng(-90,-180), new GLatLng(90,180)), 
      0,\'©2008 Greenhorns\'));
    
    // Rectangle Overlay - init and show
    var rectBounds = new GLatLngBounds(new GLatLng(-40, -179), new GLatLng(80,-1));
    var rectOverlay = new Rectangle(rectBounds);
    map.addOverlay(rectOverlay); 
    rectOverlay.show();   
    
    // create the bottom left/top right coord for the overlay and add it as a 
  	// GGroundOverlay pinning it to those bbox coords
  	// MAP_DETAILED.JPG - init and hide
  	var boundaries1 = new GLatLngBounds(
  			new GLatLng(22.727,-127.594), new GLatLng(56.417,-64.563));	
  	var mapDetailedOverlay = new GGroundOverlay("/images/handdrawn/map_detailed.jpg", boundaries1);  																					
    mapDetailedOverlay.hide();																					
  	map.addOverlay(mapDetailedOverlay); 

  	// MAP_SMALL.JPG - init and hide
  	var boundaries2 = new GLatLngBounds(
  			new GLatLng(20.64,-127.57), new GLatLng(54.48,-64.42));	
  	var mapSmallOverlay = new GGroundOverlay("/images/handdrawn/map_small.jpg", boundaries2);  																					
    //mapDetailedOverlay.hide();																					
  	map.addOverlay(mapSmallOverlay); 
                	     
  	GEvent.addListener(map, "zoomend", function(oldz, newz){
      if(newz < 6) { // 0-4 show only mapSmallOverlay and rectOverlay 
  			if(!mapDetailedOverlay.isHidden()){mapDetailedOverlay.hide();}
    	  if(rectOverlay.isHidden()){rectOverlay.show();}
  			if(mapSmallOverlay.isHidden()){mapSmallOverlay.show();}
  		} 
  		else if(newz >= 6 && newz <= 7) { // 6-7 only show mapDetailedOverlay and recOverlay 
  			if(rectOverlay.isHidden()){rectOverlay.show();}
   			if(mapDetailedOverlay.isHidden()){ mapDetailedOverlay.show();}
    	  if(!mapSmallOverlay.isHidden()){mapSmallOverlay.hide();}   			  
  		} 
  		else { // for everything else no overlays
  			if(!rectOverlay.isHidden()){rectOverlay.hide();}
   			if(!mapDetailedOverlay.isHidden()){ mapDetailedOverlay.hide();}
    	  if(!mapSmallOverlay.isHidden()){mapSmallOverlay.hide();}
  		}}); 

      // Overwrite the getMinimumResolution() and getMaximumResolution() methods
      var mt = map.getMapTypes();
      for (var i=0; i<mt.length; i++) {
        mt[i].getMinimumResolution = function() {return 3;}
      }  		
      // Add a move listener to restrict the bounds range
      GEvent.addListener(map, "move", function() {
        checkBounds();
      });

      // The allowed region which the whole map must be within
      var allowedBounds = new GLatLngBounds(new GLatLng(13.75,-140), new GLatLng(56.9,-55));
      
      // If the map position is out of range, move it back
      function checkBounds() {
        // Perform the check and return if OK
        if (allowedBounds.contains(map.getCenter())) {
          return;
        }
        // It`s not OK, so find the nearest allowed point and move there
        var C = map.getCenter();
        var X = C.lng();
        var Y = C.lat();

        var AmaxX = allowedBounds.getNorthEast().lng();
        var AmaxY = allowedBounds.getNorthEast().lat();
        var AminX = allowedBounds.getSouthWest().lng();
        var AminY = allowedBounds.getSouthWest().lat();

        if (X < AminX) {X = AminX;}
        if (X > AmaxX) {X = AmaxX;}
        if (Y < AminY) {Y = AminY;}
        if (Y > AmaxY) {Y = AmaxY;}
        //alert ("Restricting "+Y+" "+X);
        map.setCenter(new GLatLng(Y,X));
      }      
  		')  	
  		
    @map.to_html 
  end
end
