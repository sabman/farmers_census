// EBubble.js 
//
//   This Javascript is provided by Mike Williams
//   Blackpool Community Church Javascript Team
//   http://www.commchurch.freeserve.co.uk/   
//   http://econym.googlepages.com/index.htm
//
//   This work is licenced under a Creative Commons Licence
//   http://creativecommons.org/licenses/by/2.0/uk/
//
// Version 0.0  13/07/2007 Initial version
// Version 0.1  14/07/2007 Bugfix: Was failing to apply the position offset.
// Version 0.2  30/07/2007 Bugfix: Wasn't clearingout the old contents.
// Version 0.3  21/09/2007 Added noCloseOnClick parameter
// version 0.4  25/12/2007 Bugfix: Problem with offset

      function EBubble(map,image,size,insize,inset,anchor,noCloseOnClick) {
        // parameters
        var that=this;
        this.map = map;
        this.image=image;
        this.size=size;
        this.insize=insize;
        this.inset=inset;
        this.anchor=anchor;
        this.noCloseOnClick=noCloseOnClick;
        // internal variables
        this.visible = false;
        // browser - specific variables
        this.ie = false;
        var agent = navigator.userAgent.toLowerCase();
        if ((agent.indexOf("msie") > -1) && (agent.indexOf("opera") < 1)){ this.ie = true} else {this.ie = false}

        this.div1 = document.createElement("div");
        this.div1.style.position = "absolute";
        this.div1.style.display="none";
        document.body.appendChild(this.div1);


        if (this.ie && this.image.indexOf(".png")>-1) {
          var loader = "filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+this.image+"', sizingMethod='scale');";
          this.div1.innerHTML = '<div style="height:' +this.size.height+ 'px; width:'+this.size.width+'px; ' +loader+ '" ></div>';
        } else {
          this.div1.innerHTML = '<img src="' + this.image + '" width="' + this.size.width +'" height="' + this.size.height +'">';
        }
        // === Close the bubble if the map moves ===
        GEvent.addListener(map, "dragstart", function() {
          that.hide();
        } );
        GEvent.addListener(map, "moveend", function() {
          that.hide();
        } );
        // === Listen for clicks and mousedowns ===
        GEvent.addDomListener(this.div1,"click", function() {
          if (!that.noCloseOnClick) that.hide();
          GEvent.trigger(that,"click");
        });
        GEvent.addDomListener(this.div1,"mousedown", function() {
          if (!that.noCloseOnClick) that.hide();
          GEvent.trigger(that,"click");
        });

        this.div2 = document.createElement("div");
        this.div1.appendChild(this.div2);
        this.div2.style.position = "absolute";
        this.div2.style.left = this.inset.x + "px"; 
        this.div2.style.top = this.inset.y + "px";
        this.div2.style.width = this.insize.width + "px";
        this.div2.style.height = this.insize.height + "px";

      } 
      

      EBubble.prototype.openOnMap = function(point, html, offset) {
        this.offset = offset||new GPoint(0,0);
        this.point = point;


        //div2.style.backgroundColor = "#0000ff"; 
        this.div2.innerHTML = html;

        // pixel relative to map world
        var p = this.map.fromLatLngToDivPixel(point);

        // map world relative to map container
        var dragObject = this.map.getPane(G_MAP_MAP_PANE).parentNode;
        var x = p.x + parseInt(dragObject.style.left);
        var y = p.y + parseInt(dragObject.style.top);

        // map container relative to the page
        y += this.map.getContainer().offsetTop;
        x += this.map.getContainer().offsetLeft;
        
        // offset by the requested anchor position
        y -= this.anchor.y;
        x -= this.anchor.x;

        // offset by the specified offset position
        y -= this.offset.y;
        x -= this.offset.x;


        // Apply those values 
        this.div1.style.left = x+"px";
        this.div1.style.top = y+"px";
        
        // make it visible
        this.visible = true;
        this.show();
      }
      
      EBubble.prototype.openOnMarker = function(marker,html) {
        var vx = marker.getIcon().iconAnchor.x - marker.getIcon().infoWindowAnchor.x;
        var vy = marker.getIcon().iconAnchor.y - marker.getIcon().infoWindowAnchor.y;
        this.openOnMap(marker.getPoint(), html, new GPoint(vx,vy));
      }
      

      EBubble.prototype.show = function() {
        this.div1.style.display="";
        this.div2.style.display="";
        this.visible = true;
      }
      
      EBubble.prototype.hide = function() {
        this.div1.style.display="none";
        //this.div2.style.display="none";
        this.visible = false;
      }
      
      EBubble.prototype.isHidden = function() {
        return !this.visible;
      }
      
      EBubble.prototype.supportsHide = function() {
        return true;
      }
      
        