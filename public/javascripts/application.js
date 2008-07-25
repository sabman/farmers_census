// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


// A Rectangle is a simple overlay that outlines a lat/lng bounds on the
// map. It has a border of the given weight and color and can optionally
// have a semi-transparent background color.
function Rectangle(bounds, opt_weight, opt_color, opt_bg_color, opt_bg_opacity ) {
  this.bounds_ = bounds;
  this.weight_ = opt_weight || 2;
  this.color_ = opt_color || "#888888"; 
  this.backgroundColor_ = opt_bg_color || '#F5DEB3'; 
	this.opacity_  = opt_bg_opacity || 0;
}
Rectangle.prototype = new GOverlay();

// Creates the DIV representing this rectangle.
Rectangle.prototype.initialize = function(map) {
  // Create the DIV representing our rectangle
  var div = document.createElement("div");
  div.style.border = this.weight_ + "px solid " + this.color_;
  div.style.position = "absolute";
  div.style.background = "#F5DEB3";
	div.style.opacity = 0.7;

  // Our rectangle is flat against the map, so we add our selves to the
  // MAP_PANE pane, which is at the same z-index as the map itself (i.e.,
  // below the marker shadows)
  map.getPane(G_MAP_MAP_PANE).appendChild(div);

  this.map_ = map;
  this.div_ = div;
}

// Remove the main DIV from the map pane
Rectangle.prototype.remove = function() {
  this.div_.parentNode.removeChild(this.div_);
}

// Copy our data to a new Rectangle
Rectangle.prototype.copy = function() {
  return new Rectangle(this.bounds_, this.weight_, this.color_,
                       this.backgroundColor_, this.opacity_);
}

// Redraw the rectangle based on the current projection and zoom level
Rectangle.prototype.redraw = function(force) {
  // We only need to redraw if the coordinate system has changed
  if (!force) return;

  // Calculate the DIV coordinates of two opposite corners of our bounds to
  // get the size and position of our rectangle
  var c1 = this.map_.fromLatLngToDivPixel(this.bounds_.getSouthWest());
  var c2 = this.map_.fromLatLngToDivPixel(this.bounds_.getNorthEast());

  // Now position our DIV based on the DIV coordinates of our bounds
  this.div_.style.width = Math.abs(c2.x - c1.x) + "px";
  this.div_.style.height = Math.abs(c2.y - c1.y) + "px";
  this.div_.style.left = (Math.min(c2.x, c1.x) - this.weight_) + "px";
  this.div_.style.top = (Math.min(c2.y, c1.y) - this.weight_) + "px";
}

function initialize_map() {
  if (GBrowserIsCompatible()) {
    var map = new GMap2(document.getElementById("map_canvas"),
        { size: new GSize(640,320) } );
		map.removeMapType(G_SATELLITE_MAP);   
		map.removeMapType(G_HYBRID_MAP);
		map.addMapType(G_PHYSICAL_MAP)
    map.removeMapType(G_NORMAL_MAP);       

		var pointCenter = new GLatLng(37.71859032558813, -99.052734375);
		map.setCenter(pointCenter, 3);
		
    map.addControl(new GLargeMapControl());

    var mapControl = new GMapTypeControl();
    map.addControl(mapControl);

		var pointSW = new GLatLng(23.226236,-127.111816);
		var pointNE = new GLatLng(52.643063,-64.599609);
		var groundOverlay = new GGroundOverlay("http://img37.picoodle.com/img/img37/4/7/22/f_handdrawntrm_b7407d9.png", 
																						new GLatLngBounds(pointSW, pointNE));
		map.addOverlay(groundOverlay); 
		
    // Display a rectangle in the center of the map at about a quarter of
    // the size of the main map
    var bounds = map.getBounds();
    var southWest = bounds.getSouthWest();
    var northEast = bounds.getNorthEast();
    var lngDelta = (northEast.lng() - southWest.lng());
    var latDelta = (northEast.lat() - southWest.lat());
    var rectBounds = new GLatLngBounds(
        new GLatLng(southWest.lat() + latDelta,
                    southWest.lng() + lngDelta),
        new GLatLng(northEast.lat() - latDelta,
                    northEast.lng() - lngDelta));
    map.addOverlay(new Rectangle(rectBounds, null, '#F5DEB3', '#F5DEB3', 50 ));
    
  }
}


function create_draggable_marker_for_edit(lng, lat) { 
// initalize form fields 
document.getElementById('lng').value = lng; 
document.getElementById('lat').value = lat; 
// initalize marker 
var currMarker = new GMarker( new GLatLng(lat, lng), {draggable: true} ); 
map.addOverlay(currMarker); 
// Handle drag events to update the form text fields 
GEvent.addListener(currMarker, 'drag', function() { 
document.getElementById('lng').value = currMarker.getPoint().lng(); 
document.getElementById('lat').value = currMarker.getPoint().lat(); 
}); 
} 


function create_draggable_editable_marker() 
{ 
// intialize the values in form fields to 0 
document.getElementById("lng").value = 0; 
document.getElementById("lat").value = 0; 
var currMarker; 
// if the user click on an existing marker remove it 
GEvent.addListener(map, "click", function(marker, point) { 
if (marker) { 
if (confirm("Do you want to delete marker?")) { 
map.removeOverlay(marker); 
} 
} 
// if the user clicks somewhere other than existing marker 
else { 
// remove the previous marker if it exists 
if (currMarker) { 
map.removeOverlay(currMarker); 
} 
currMarker = new GMarker(point, {draggable: true}); 
map.addOverlay(currMarker); 
// update the form fields 
document.getElementById("lng").value = point.x; 
document.getElementById("lat").value = point.y; 
} 
// Similarly drag event is used to update the form fields 
GEvent.addListener(currMarker, "drag", function() { 
document.getElementById("lng").value = currMarker.getPoint().lng(); 
document.getElementById("lat").value = currMarker.getPoint().lat(); 
}); 
}); 
} 
