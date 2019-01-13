<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="com.rescue.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="java.util.*"%>


<%
	RescueVO rescueVO  = (RescueVO) request.getAttribute("rescueVO");
	MemService memSvc = new MemService();
	MemVO memVO = memSvc.getOneMem("M000000001");
	session.setAttribute("memVO",memVO);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Map</title>

<script>
        window.onload = function(){
              if(window.localStorage.lastSearch != undefined){
                 document.getElementById("searchtext").value = window.localStorage.lastSearch; 
              }  
            };
</script>

<style type="text/css">
p {
	font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
		monospace;
}

div {
	font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
		monospace;
}

body {
  margin: 0;
}

#map {
  height: 430px;
  position: relative;
  width: 500px;
}

.maps-frame {
  height: 430px;
  width: 500px;
}

.kd-tabbed-vert.header-links .kd-tabbutton a {
  color: #757575;
  display: inline-block;
  height: 100%;
  padding: 0 24px;
  width: 500px;
}

.kd-tabbed-vert.header-links .kd-tabbutton {
  padding: 0;
}

.kd-tabbed-vert.header-links .kd-tabbutton.selected a {
  color: #03a9f4;
}

.kd-tabbed-vert.header-links .kd-tabbutton a:focus {
  text-decoration: none;
}

p.top-desc {
  padding: 1em 1em .1em 1em;
}

p.bottom-desc {
  padding: 0em 1em 1em 1em;
}

</style>
</head>
<body>


<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAb2lDof7yMn-TTXwt2hwVm4y92t1AqvyU&callback=initMap&libraries=places" async defer></script>
<body>
<textarea placeholder="Enter Area name to populate Latitude and Longitude" name="address" onFocus="initializeAutocomplete()" id="locality" ></textarea><br>

<input id="address" type="text" style="width:600px;"/><br/>
<!-- <input type="text" name="city" id="city" placeholder="City" value="" ><br> -->
<input type="text" name="latitude" id="latitude" placeholder="Latitude" value="" ><br>
<input type="text" name="longitude" id="longitude" placeholder="Longitude" value="" ><br>
<input type="text" name="place_id" id="location_id" placeholder="Location Ids" value="" ><br>
<div id="current"></div>

<div id="map"></div>



<script>
// 參數用法:https://developers.google.com/maps/documentation/javascript/places#place_search_requests
// 程式碼範例:https://developers.google.com/maps/documentation/javascript/places#place_search_requests
// Type種類:https://developers.google.com/places/supported_types
// 參考程式碼:https://developers.google.com/maps/documentation/javascript/examples/place-search?hl=zh-tw
//google搜尋Google Map Platform --> Place Types --> Place Library --> Samples

var map;
var myMarker;
var infowindow;
var serice;
var c;



function initMap() {
    window.navigator.geolocation.getCurrentPosition(myFlow);

  
}

function myFlow(a) {
	
	
	var myLatlng = new google.maps.LatLng(a.coords.latitude,a.coords.longitude);
	var geocoder = new google.maps.Geocoder();
	infowindow = new google.maps.InfoWindow();
	
	
	c = {
            lat: a.coords.latitude,
            lng: a.coords.longitude
        };
	
	 map = new google.maps.Map(document.getElementById('map'), {
	        zoom: 13,
	        center: c,
	        mapTypeId: google.maps.MapTypeId.ROADMAP
	    });
	 
	 
	 myMarker = new google.maps.Marker({
	        position: { lat: a.coords.latitude, lng: a.coords.longitude },
	        draggable: true
	    });
	  
	  geocoder.geocode({'latLng': myLatlng }, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				if (results[0]) {
					$('#latitude,#longitude').show();
					$('#address').val(results[0].formatted_address);
					$('#latitude').val(myMarker.getPosition().lat());
					$('#longitude').val(myMarker.getPosition().lng());
					infowindow.setContent(results[0].formatted_address);
					infowindow.open(map, myMarker);
				}
			}
		});
	    
	    google.maps.event.addListener(myMarker, 'dragend', function(evt){
	        document.getElementById('current').innerHTML = '<p>Marker dropped: Current Lat: ' + evt.latLng.lat().toFixed(3) + ' Current Lng: ' + evt.latLng.lng().toFixed(3) + '</p>';
	        geocoder.geocode({'latLng': myMarker.getPosition()}, function(results, status) {
	    		if (status == google.maps.GeocoderStatus.OK) {
	    			if (results[0]) {
	    				$('#locality').val(results[0].formatted_address);
	    				$('#address').val(results[0].formatted_address);
	    				$('#latitude').val(myMarker.getPosition().lat());
	    				$('#longitude').val(myMarker.getPosition().lng());
	    				infowindow.setContent(results[0].formatted_address);
	    				infowindow.open(map, myMarker);
	    			}
	    		}
	    	});
	    
	    });

	    google.maps.event.addListener(myMarker, 'dragstart', function(evt){
	        document.getElementById('current').innerHTML = '<p>Currently dragging marker...</p>';
	    });
	    
	    map.setCenter(myMarker.position);
	    myMarker.setMap(map);
	    
	 
        
       
	

    service = new google.maps.places.PlacesService(map);

   
}



</script>


<script type="text/javascript">
  function initializeAutocomplete(){
    var input = document.getElementById('locality');
    // var options = {
    //   types: ['(regions)'],
    //   componentRestrictions: {country: "IN"}
    // };
    var options = {}

    var autocomplete = new google.maps.places.Autocomplete(input, options);

    google.maps.event.addListener(autocomplete, 'place_changed', function() {
      var place = autocomplete.getPlace();
      var lat = place.geometry.location.lat();
      var lng = place.geometry.location.lng();
      var placeId = place.place_id;
      // to set city name, using the locality param
      var componentForm = {
        locality: 'short_name',
      };
      for (var i = 0; i < place.address_components.length; i++) {
        var addressType = place.address_components[i].types[0];
        if (componentForm[addressType]) {
          var val = place.address_components[i][componentForm[addressType]];
          document.getElementById("city").value = val;
        }
      }
      document.getElementById("latitude").value = lat;
      document.getElementById("longitude").value = lng;
      document.getElementById("location_id").value = placeId;
      $('#address').val(place.name);
      console.log("111111"+place.address_components[0].long_name);
      
      // If the place has a geometry, then present it on a map.
      if (place.geometry.viewport) {
        map.fitBounds(place.geometry.viewport);
      } else {
        map.setCenter(place.geometry.location);
        map.setZoom(17);  // Why 17? Because it looks good.
      }
      myMarker.setPosition(place.geometry.location);
      myMarker.setVisible(true);

      var address = '';
      if (place.address_components) {
        address = [
          (place.address_components[0] && place.address_components[0].short_name || ''),
          (place.address_components[1] && place.address_components[1].short_name || ''),
          (place.address_components[2] && place.address_components[2].short_name || ''),
          (place.address_components[3] && place.address_components[3].short_name || ''),
          (place.address_components[4] && place.address_components[4].short_name || ''),
          (place.address_components[5] && place.address_components[5].short_name || ''),
        ].join(' ');
      }
      
      $('#address').val(address);
      console.log("22222"+address);

//       infowindowContent.children['place-icon'].src = place.icon;
//       infowindowContent.children['place-name'].textContent = place.name;
//       infowindowContent.children['place-address'].textContent = address;
//       infowindow.open(map, myMarker);

      infowindow.setContent($("#locality").val());
	  infowindow.open(map, myMarker);
    });
      
      
      
      
      
  }
</script>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>





</body>
</html>