function create_draggable_marker_for_edit(lng, lat) { 
	// initalize form fields 
	document.getElementById('lng').value = lng; 
	document.getElementById('lat').value = lat; 
	// initalize marker 
	var currMarker = new GMarker( new GLatLng(lat, lng), {draggable: true, bouncy: true, icon: icon_standard} ); 
	map.addOverlay(currMarker); 
	// Handle drag events to update the form text fields 
	GEvent.addListener(currMarker, 'drag', function() { 
		document.getElementById('lng').value = currMarker.getPoint().lng(); 
		document.getElementById('lat').value = currMarker.getPoint().lat(); 
		document.getElementById('lng_display').innerHTML = currMarker.getPoint().lng(); 
		document.getElementById('lat_display').innerHTML = currMarker.getPoint().lat(); 
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
			var customIcon = create_icon();
			currMarker = new GMarker(point, {draggable: true, icon:customIcon}); 
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


// A Rectangle is a simple overlay that outlines a lat/lng bounds on the
// map. It has a border of the given weight and color and can optionally
// have a semi-transparent background color.
function Rectangle(bounds, opt_weight, opt_color) {
  this.bounds_ = bounds;
  this.weight_ = opt_weight || 2;
  this.color_ = "#FFFFFF"; //opt_color || "#888888"; 
	this.opacity_ = 0.5;
	this.backgroundColor_ = "#FFFFFF";
	this.color_ = "#FFFFFF";	
}
Rectangle.prototype = new GOverlay();

// Creates the DIV representing this rectangle.
Rectangle.prototype.initialize = function(map) {
  // Create the DIV representing our rectangle
  var div = document.createElement("div");
  div.style.border = this.weight_ + "px solid " + this.color_;
  div.style.position = "absolute";
	div.style.backgroundColor = this.backgroundColor_;

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


Rectangle.prototype.hide = function() {
  this.div_.style.display = "none";
}

Rectangle.prototype.show = function() {
  this.div_.style.display = "block";
}

Rectangle.prototype.isHidden = function() {
  if(this.div_.style.display == "none")
		return 1;
	else 
		return 0;		
}

function remove_copyright(){
	var x = document.getElementsByTagName("span")
	var n = x.length;
	for(var i=0; i<n ; i=i+1){
		x[i].style.visibility="hidden";
	}
}

function show_copyright(){
	var x = document.getElementsByTagName("span")
	var n = x.length;
	for(var i=0; i<n ; i=i+1){
		x[i].style.visibility="";
	}
}

function create_icon(){
	var icon_handdrawn = addOptionsToIcon(
		new GIcon(),{ iconAnchor : new GPoint(9,34), infoWindowAnchor : new GPoint(22,22),
		image : "/images/hand_print_icon"+rand(0,7)+".png"});
	return icon_handdrawn;
}

function rand( min, max ) {
    // http://kevin.vanzonneveld.net
    // +   original by: Leslie Hoare
    // *     example 1: rand(1, 1);
    // *     returns 1: 1
    if( max ) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
    } else {
        return Math.floor(Math.random() * (min + 1));
    }
}

function create_transp_round_green_icon() {
  var icon = new GIcon();
  icon.image = "/images/circle_green_12.png";
  icon.shadow = "";
  icon.iconSize = new GSize(12.0, 12.0);
  icon.iconAnchor = new GPoint(6.0, 6.0);
  icon.infoWindowAnchor = new GPoint(6.0, 6.0);
	return icon;
}

function create_transp_big_blue_icon() {
	var icon = new GIcon();
	icon.image = "/images/circle_blue.png";
//	icon.shadow = "/images/shadow-circle_blue_transp.png";
	icon.iconSize = new GSize(48.0, 48.0);
	icon.shadowSize = new GSize(73.0, 48.0);
	icon.iconAnchor = new GPoint(24.0, 24.0);
	icon.infoWindowAnchor = new GPoint(24.0, 24.0);
	return icon;
}

function create_transp_round_red_icon() {
  var icon = new GIcon();
  icon.image = "/images/circle_red_12.png";
  icon.shadow = "";
  icon.iconSize = new GSize(12.0, 12.0);
  icon.iconAnchor = new GPoint(6.0, 6.0);
  icon.infoWindowAnchor = new GPoint(6.0, 6.0);
	return icon;
}

