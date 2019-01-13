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
  width: 1000px;
}

.maps-frame {
  height: 430px;
  width: 1000px;
}

.kd-tabbed-vert.header-links .kd-tabbutton a {
  color: #757575;
  display: inline-block;
  height: 100%;
  padding: 0 24px;
  width: 1000px;
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

<input type="text" name="city" id="city" placeholder="City" value="" ><br>
<input type="text" name="latitude" id="latitude" placeholder="Latitude" value="" ><br>
<input type="text" name="longitude" id="longitude" placeholder="Longitude" value="" ><br>
<input type="text" name="place_id" id="location_id" placeholder="Location Ids" value="" ><br>

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
    });
  }
</script>



<div class="input-group">
	<label class="input-group-addon" for="rsc_add" style="width: 150px;">救援案例地點</label>
	<input type="text" class="form-control" placeholder="救援案例地點" value="<%= (rescueVO==null)? "" : rescueVO.getRsc_add()%>" id="rsc_add" name="rsc_add" style="width: 500px;">
</div>

<iframe width="560" height="315" src="https://www.youtube.com/embed/live_stream?channel=UCvlH0X2eqSZzN8_gGIuUkSg" frameborder="0" allowfullscreen></iframe>

<div class="container">
        <div class="col-sm-6 col-sm-offset-3">
            <!-- 搜尋欄與按鈕，
                    參考https://getbootstrap.com/docs/3.3/components/#input-groups  選取左方Button addons-->
<!--             <div class="input-group"> -->
<!--             	<label for="searchtext">Location</label> -->
<!--                 <input id="searchtext" type="text" class="form-control" placeholder="Search for..."> -->
<!--                 <span class="input-group-btn"> -->
<!--                     <button class="btn btn-default" type="button" onclick="mySearch();">Go!</button> -->
<!--                     直接在button呼叫js程式碼，是比較好的做法，如果用事件處理器註冊到時候很容易找不到   -->
<!--                 </span> -->
<!--             </div> -->


            <div id="map"></div>
            <div id="directionsPanel" style="display:inline"></div>
            <div id="instruction" style="display:inline"></div>
        </div>
    </div>


<script>
// 參數用法:https://developers.google.com/maps/documentation/javascript/places#place_search_requests
// 程式碼範例:https://developers.google.com/maps/documentation/javascript/places#place_search_requests
// Type種類:https://developers.google.com/places/supported_types
// 參考程式碼:https://developers.google.com/maps/documentation/javascript/examples/place-search?hl=zh-tw
//google搜尋Google Map Platform --> Place Types --> Place Library --> Samples

var map;
var infowindow;
var service;
var center;
var geocoder;
var directionsService;
var directionsDisplay;

function initMap() {
    window.navigator.geolocation.getCurrentPosition(myFlow);
   

  
}

function myFlow(a) {
	
	center = {
            lat: a.coords.latitude,
            lng: a.coords.longitude
        };
	
	 var map = new google.maps.Map(document.getElementById('map'), {
	        zoom: 10,
	        center: {lat: a.coords.latitude,
	            lng: a.coords.longitude},
	        mapTypeId: google.maps.MapTypeId.ROADMAP
	    });
	 
	 var marker = new google.maps.Marker({
         position:{
             lat: a.coords.latitude,
             lng: a.coords.longitude
         },
         map: map,
         title: '我的位置',
         clickable: true
     });
	 
	 var rescue = [{lat:24.969289, lng:121.236452, name:"小貓卡牆縫內"}, {lat:24.8568142, lng:121.2936528, name:"老街溪狐狸犬" }];
     for (var i = 0; i < rescue.length; i++) {
        
        console.log(rescue[i]);    //可按F12觀察搜尋結果詳細資訊
        console.log(rescue.length);    //可按F12觀察搜尋結果詳細資訊
        var lat=rescue[i].lat;
    	var lng=rescue[i].lng; 
        var myLatLng = rescue[i];
        var marker = new google.maps.Marker({
            position: myLatLng,
            map: map,
            title: myLatLng.name,
            clickable: true
//             draggable: true
        });
        
     // place 
        infowindow = new google.maps.InfoWindow();

        service = new google.maps.places.PlacesService(map);
        
        google.maps.event.addListener(marker, 'click', function (event) {
        	var $this=this;
        	
        	console.log("this.title==="+$this.title);
        	console.log("this.lat==="+event.latLng.lat());
        	console.log("this.lng==="+event.latLng.lng());
        	console.log("$this==="+$this.position);
//         	console.log("@@@@@"+this.position.lat);
//         	console.log("@@@@@"+this.position.lng);
        	console.log(this.position);
            msg = this.title + "<br>" ;
//             for (var i = 0; i < place.rating; i++) {
//                 msg = msg + "\u2665"
//             }
            //自行設定要顯示的msg(商家資訊+評價...等等)
            infowindow.setContent(msg+ "<br>"+
                    "<input type='button' onClick=getDir("+event.latLng.lat() +","+ event.latLng.lng()+") value='Go!'>");
            console.log("<input type='button' onClick=getDir("+event.latLng.lat() +","+ event.latLng.lng()+") value='Go!'>");
            infowindow.open(map, this); //this代表marker
            
            $("#instruction").text("");
        });
    }
	 
	     var latlng = new google.maps.LatLng(a.coords.latitude, a.coords.longitude);
	     map.setCenter(latlng);
	    
	    marker.setMap(map);
	    
	    geocoder = new google.maps.Geocoder();
	    directionsService = new google.maps.DirectionsService();
	    directionsDisplay = new google.maps.DirectionsRenderer({
	        suppressMarkers: false
	    });
	    directionsDisplay.setMap(map);
	    directionsDisplay.setPanel(document.getElementById("directionsPanel"));
	 
        
       
	
	
    // place 
    infowindow = new google.maps.InfoWindow();

    service = new google.maps.places.PlacesService(map);

   
}

function getDir(lat,lng) {
//     geocoder.geocode({
//         'address': center
//     },

//     function (results, status) {
//         if (status == google.maps.GeocoderStatus.OK) {
//             var origin = results[0].geometry.location;
console.log("getDir_lat==="+lat);
console.log("getDir_lng==="+lng);
            var destination = new google.maps.LatLng(lat, lng);

            console.log("center_lat="+center.lat+", center_lng"+center.lng);
            var request = {
                origin: center,
                destination: destination,
                travelMode: google.maps.DirectionsTravelMode.DRIVING
            };

            
            directionsService.route(request, function (result, status) {
                if (status == 'OK') {
                    // 回傳路線上每個步驟的細節
                    console.log(result.routes[0].legs[0].steps);
                    directionsDisplay.setDirections(result);
                    $("#instruction").text(result.routes[0].legs[0].steps);
                } else {
                    console.log("======"+status);
                }
            });
            
//             directionsService.route(request, function (response, status) {
//                 if (status == google.maps.DirectionsStatus.OK) {
//                     directionsDisplay.setDirections(response);
//                 }
//             });

//         } else {
//             document.getElementById('clientAddress').value =
//             "Directions cannot be computed at this time.";
//         }
//     });
}



// google.maps.event.addDomListener(window, 'load', init);

</script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>




</body>
</html>