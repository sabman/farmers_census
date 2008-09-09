require 'rubygems'
require 'geo_ruby' 
module FrontPageHelper
  include GeoRuby::SimpleFeatures
  
  def show_maps recs
    @map = GMap.new("map_div", "map")
    @map.control_init(:small_map => true, :map_type => false)
    @map.record_init @map.add_map_type(GMapType::G_PHYSICAL_MAP)    
    @map.set_map_type_init(GMapType::G_PHYSICAL_MAP)
    @map.record_init('var icon_handprint = create_icon();')
    icon_handprint = Variable.new("icon_handprint")
    coords = [] 
    recs.each do |rec|
      unless rec.lng == nil or rec.lat == nil
        coords << [rec.lng.to_f, rec.lat.to_f] 
        @map.record_init @map.add_overlay(
          GMarker.new([rec.lat.to_f, rec.lng.to_f], 
            :title => "#{rec.farm_name}", :icon => icon_handprint,   
            :info_window => "
              #{image_tag show_avatar(rec)} 
              <h2>#{rec.farm_name}</h2> 
              #{rec.full_address} <br/> 
              #{link_to "See full profile", survey_path(rec)}"))
       end
    end
    coords = (coords.length == 0) ? [[-121.640625,26.431228],[-68.554687,47.15984]] : coords # if there are no records just zoom/center over 0,0      
   # bnd = MultiPoint.from_coordinates(coords).envelope
   # @map.center_zoom_on_bounds_init([[bnd.lower_corner.y,bnd.lower_corner.x],[bnd.upper_corner.y,bnd.upper_corner.x]])
    @map.center_zoom_init([37.5,-93.6],4)   
    
    @map.record_init( '      
				var copyright = new GCopyright(1, new GLatLngBounds(new GLatLng(-90,-180), new GLatLng(90,180)), 0, "greenhorns");
				var copyrightCollection = new GCopyrightCollection("greenhorns");
				copyrightCollection.addCopyright(copyright);

				var tilelayers = [];
				tilelayers[0] = new GTileLayer(copyrightCollection, 1, 18);

				function TileToQuadKey (x, y, zoom){
    			var quad = "";
    			for (var i = zoom; i > 0; i--){
        		var mask = 1 << (i - 1);
        		var cell = 0;
        		if ((x & mask) != 0)
            	cell++;
        		if ((y & mask) != 0)
            	cell += 2;
        		quad += cell;
    			}
    			return quad;
				}

				tilelayers[0].getTileUrl = function (a, b) {
					return "/images/tiles/" + TileToQuadKey(a.x,a.y,b) + ".png"; 
				};
				tilelayers[0].isPng = function() { return true;};
				tilelayers[0].getOpacity = function() { return 1.0; };

				var custommap = new GMapType(tilelayers, new GMercatorProjection(19), "greenhorns", {errorMessage:"Greenhorns"});
				map.addMapType(custommap);
				map.setMapType(custommap);
               	     
 			 	GEvent.addListener(map, "zoomend", function(oldz, newz){
    	 		if(newz > 6) {
						map.setMapType(G_PHYSICAL_MAP);
  				} else {
						map.setMapType(custommap);
					}
				}); 

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

				function getElementsByClass(searchClass,node,tag) {
					var classElements = new Array();
					if ( node == null )
					node = document;
					if ( tag == null )
						tag = "*";
					var els = node.getElementsByTagName(tag);
					var elsLen = els.length;
					var pattern = new RegExp("(^|\\\\s)"+searchClass+"(\\\\s|$)");
					for (i = 0, j = 0; i < elsLen; i++) {
						if ( pattern.test(els[i].className) ) {
							classElements[j] = els[i];
							j++;
						}
					}
					return classElements;
				}
				var gmnoprint = getElementsByClass("gmnoprint");
				for (i = 0; i < gmnoprint.length; i++) {
					if (!gmnoprint[0].style.width) {
						gmnoprint[i].style.visibility = "hidden";
					}
				} 

    		var itemcontrol = new HtmlControl("<img src=\"/images/compass-small.png\"/>");
				map.addControl(itemcontrol, new GControlPosition(G_ANCHOR_BOTTOM_RIGHT, new GSize(0, -10)));

  		')  	
  		
    @map.to_html 
  end
end
