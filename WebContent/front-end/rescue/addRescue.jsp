<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="com.rescue.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="java.util.*"%>


<%
	RescueVO rescueVO  = (RescueVO) request.getAttribute("rescueVO");
	MemVO memVO =(MemVO) session.getAttribute("memVO");
%>

<html>
<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/logo3.png">
<!-- Author Meta -->
<meta name="author" content="codepixer">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>浪我陪你-新增救援</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js" type="text/javascript"></script>

<script src="<%=request.getContextPath()%>/ckeditor2/ckeditor.js"></script>
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
  height: 350px;
  position: relative;
  width: 350px;
}

.maps-frame {
  height: 430px;
  width: 500px;
}

</style>

</head>
<body>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAb2lDof7yMn-TTXwt2hwVm4y92t1AqvyU&callback=initMap&libraries=places" async defer></script>

	<jsp:include page="/index_Header.jsp" flush="true" />

		<div class="container">
			<div class="row d-flex justify-content-center ">
				<div class="col-md-9 pb-40 header-text text-center"style="padding-bottom: 0px">
					<h1 class="pb-10">救援案例新增</h1>
						<%-- 錯誤表列 --%>
						<c:if test="${not empty errorMsgs}">
							<div>
								<font style="color:red">請修正以下錯誤:</font>
								<ul>
									<c:forEach var="message" items="${errorMsgs}">
										<li style="color:red">${message}</li>
									</c:forEach>
								</ul>
							</div>
						</c:if>
				</div>
			</div>
			</div>
			<div class="content-fulid">
				<div class="row">
				<div class="col-sm-1">
					<div style="position: fixed">
                    	<img id="miracleBtn" style="width:60px;height:60px;"class="img-fluid" src="<%=request.getContextPath()%>/images/magicbtn.png">	
                	</div>
                </div>
					<div class="col-sm-10">		
						<form METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/rescue/rescue.do" enctype="multipart/form-data">
                        	<div class="card">
                            <div class="card-header">
                            
                                <strong>救援案例新增</strong>
                            </div>
                            
                            <div class="card-body card-block">
                                <div class="form-group">
                                    <label class=" form-control-label" >救援案例名稱：</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i style="color:red" class="fa fa-registered"></i></div>
                                        <input type="text" class="form-control" placeholder="救援案例名稱" 
						  				   value="<%= (rescueVO==null)? "" : rescueVO.getRsc_name()%>" id="rsc_name" name="rsc_name" >
                                    	</div>      
                                	</div>
                                	<jsp:useBean id="regionSvc" scope="page" class="com.region.model.RegionService" />
                                <div class="form-group">
                                    <label class=" form-control-label">地區：</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-globe-asia" style="color:#33d6ff"></i></div>
                                        <select class="form-control custom-control" id="reg_id" name="reg_id" style="width: 100px; height:32px;">
										<option value="請選擇">請選擇
									    <c:forEach var="regionVO" items="${regionSvc.all}">
										<option value="${regionVO.reg_id}" ${(rescueVO.rsc_reg==regionVO.reg_id)? 'selected':'' } >${regionVO.reg_name}
									    </c:forEach>
								  	</select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">救援案例地點：</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-map-marked-alt" style="color:#ff9933"></i></div>
                                        <input type="text" class="form-control" placeholder="救援案例地點" 
								  		    name="rsc_add" onFocus="initializeAutocomplete()" id="locality" >
                                    </div>
                                </div>
                                <div style="display:none">
<!-- 								<input id="address" type="hidden" name="rsc_add" style="width:600px;"/><br/> -->
								<input type="hidden" name="rsc_lat" id="latitude" placeholder="Latitude" value="" ><br>
								<input type="hidden" name="rsc_lon" id="longitude" placeholder="Longitude" value="" ><br>
								<input type="hidden" name="place_id" id="location_id" placeholder="Location Ids" value="" ><br>
								<div style="display:none" id="current"></div>
								</div>
								<div id="map"></div>
								<br>
                                <div class="form-group">
                                    <label class=" form-control-label">上傳案例照片：</label>
                                    <div class="input-group" id="preview">
                                    	<img width="300" height="200" src="<%=request.getContextPath()%>/front-end/donate/noPic.png" style="padding-right: 30px;"/>
                                    </div>
                                    <div style="width:270px;text-align:center">
								<input type="file" class="upl custom-file-input" name="rsc_img" id="rsc_img">
								<label class="genric-btn info-border small" for="rsc_img" >選擇圖片</label>
								</div>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">救援案例描述：</label>
                                    <div class="input-group">
                                    <small class="form-text text-muted">可放入圖片</small>
                                    </div>
                                    <textarea rows="30" cols="80" name="rsc_des" id="rsc_des"></textarea>
                                    <script>
                                    CKEDITOR.replace( 'rsc_des', {
     				                   removePlugins:'image',
                                    	extraPlugins: 'easyimage',
     				                      cloudServices_tokenUrl: 'https://36758.cke-cs.com/token/dev/g529dLeMZwwIpbMNAdeiRdeIbIjTrMw6aq0ncGUTnfbb08SqLh6Z2I87wBM3',
     				                      cloudServices_uploadUrl: 'https://36758.cke-cs.com/easyimage/upload/',}); 
                                    </script>
                                </div>
                            </div>
                            <input type="hidden" name="action" value="insert">
                            <input type="hidden" name="rsc_sponsor" value="${memVO.memb_id}">
                            <div align="center">
                            
                            <button class="genric-btn primary" style="width:120px;height:40px;font-size:20px;" id="submit">送出</button>
                            <br>
                            <br>
                            </div>
                        </div>
                        </form>
                        
                    </div>
                    <div class="col-sm-1"></div>
				</div>
			</div>
<script type="text/javascript">
			$('#miracleBtn').click(function(){
				console.log('1111111111111111');
				$('#rsc_name').val('野豬失足卡水溝翻肚四腳朝天');
				$('#reg_id').val('REG0000004');
				
				
				
				
			});
</script>		
		
	
<script>
		var i;
		var files = $("#form :file"); //若只有單一表格要做動態樣式，則可以使用css選擇器
		$("#rsc_img").change(function() {
			$("#preview").html("");
			console.log(this);
			readURL(this);
		});
	
		function readURL(input) {
			if (input.files && input.files.length>= 0) {
				for (var i = 0; i < input.files.length; i++) {
					var reader = new FileReader();
					reader.readAsDataURL(input.files[i]);
					reader.onload = function(e) {
					var img = $("<img width='300' height='200'>").attr('src', e.target.result);
						console.log(img);
						$("#preview").append(img).append("<br>").append("<br>");
					}
				}
			}
		}
		

	  
		
		
	</script>
	
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



$(function initMap() {
	console.log("map");
    window.navigator.geolocation.getCurrentPosition(myFlow);
}

);

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
					$('#locality').val(results[0].formatted_address);
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





</body>
</html>