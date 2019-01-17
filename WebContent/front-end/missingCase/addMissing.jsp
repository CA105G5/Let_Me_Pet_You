<%@page import="com.mem.model.MemVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.missingCase.model.*"%>

<%
	missingCaseVO missingCaseVO = (missingCaseVO) request.getAttribute("missingCaseVO");


	MemVO memVO = (MemVO) session.getAttribute("memVO");
	
	java.sql.Timestamp missingDate = null;
	try {
		missingDate = missingCaseVO.getMissing_date();
	 } catch (Exception e) {
		 missingDate = new java.sql.Timestamp(System.currentTimeMillis());
	 }
%>



<html>
<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="img/fav.png">
<!-- Author Meta -->
<meta name="author" content="codepixer">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>新增救援案例</title>

<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">
<!--
			CSS
			============================================= -->
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
<script src="js/jquery-1.12.3.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/ckeditor2/ckeditor.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
<script src="js/jquery-1.12.3.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js" type="text/javascript"></script>
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
#map {
  height: 430px;
  position: relative;
  width: 500px;
}

.maps-frame {
  height: 430px;
  width: 500px;
}
</style>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAb2lDof7yMn-TTXwt2hwVm4y92t1AqvyU&callback=initMap&libraries=places" async defer></script>

</head>
<body onload="connect();" onunload="disconnect();">

	<jsp:include page="/index_Header.jsp"
		flush="true" />

		<div class="container">
			<div class="row d-flex justify-content-center ">
				<div class="col-md-9 pb-40 header-text text-center">
					<h1 class="pb-10">失蹤案例新增</h1>
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
			
	<form class="form-area " action="<%=request.getContextPath()%>/front-end/missingCase/miss.do"
						method="post" class="contact-form text-right" enctype="multipart/form-data">		
		<div class="content">
           <div class="animated fadeIn">
			<div class="row">
			<div class="col-sm-12">
                        <div class="card">
                            <div class="card-header">
                                <strong>失蹤案例新增</strong> <small>請輸入寵物資料：</small>
                            </div>
                            <div class="card-body card-block">
                                <div class="form-group">
                                    <label class=" form-control-label" >寵物名稱：</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-dog"></i></div>
                                        <input class="form-control" name="missingName" id="missingName" value="<%= (missingCaseVO ==null)?"" : missingCaseVO.getMissing_name()%>">
                                    </div>
                                    <small class="form-text text-muted">ex. 小白/阿明/乖乖</small>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">寵物種類：</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-paw"></i></div>
                                        <input class="form-control" name="missing_type" id="missing_type" value="<%= (missingCaseVO ==null)?"" : missingCaseVO.getMissing_type()%>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">失蹤地點：</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fas fa-map-marker-alt"></i></div>
                                        <input class="form-control" name="loc" id="loc" onFocus="initializeAutocomplete()" id="loc" value="<%= (missingCaseVO ==null)?"" : missingCaseVO.getMissing_loc()%>">
                                    </div>
                                    <div id="map"></div>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">失蹤日期：</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="far fa-clock"></i></div>
                                        <input class="form-control" name="hiredate" id="hiredate" value="<%= (missingCaseVO ==null)?"" : missingCaseVO.getMissing_date()%>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">寵物大頭照：</label>
                                    <div class="input-group" id="preview">
                                    	<img width="250" height="200" src="<%=request.getContextPath()%>/front-end/donate/noPic.png" style="padding-right: 30px;"/>
                                    </div>
                                    <div style="text-align:center">
								<input type="file" class="upl custom-file-input" name="missing_img" id="missing_img">
								<label class="genric-btn info-border small" for="missing_img" >選擇圖片</label>
								</div>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">失蹤內容描述：</label>
                                    <div class="input-group">
                                    <small class="form-text text-muted">可放入圖片</small>
                                    </div>
                                    <textarea name="missingDes"><%= (missingCaseVO ==null)?"" : missingCaseVO.getMissing_des()%></textarea>
                                    <script>
                                    CKEDITOR.replace( 'missingDes', {
                                    	removePlugins:'image',
     				                   extraPlugins: 'easyimage',
     				                      cloudServices_tokenUrl: 'https://36758.cke-cs.com/token/dev/g529dLeMZwwIpbMNAdeiRdeIbIjTrMw6aq0ncGUTnfbb08SqLh6Z2I87wBM3',
     				                      cloudServices_uploadUrl: 'https://36758.cke-cs.com/easyimage/upload/',}); 
                                    </script>
                                </div>
                            </div>
                            <input type="hidden" name="action" value="insert">
                            <input type="hidden" name="missing_status_shelve" value="上架">
                            <input type="hidden" name="membno" value="<%=(memVO ==null)? "" : memVO.getMemb_id()%>">
                            
                            <div align="center">
                            <input type="submit"  value="送出"  style="width:120px;height:40px;font-size:20px;" id="submit">
                            <img id="miracleBtn" style="width:60px;height:60px;"class="img-fluid" src="<%=request.getContextPath()%>/images/magicbtn.png">	
                            </div>
                        </div>
                        </form>
                        
                    </div>
				</div>
			</div>
			</div>
		</div>
<script>
		var i;
		var files = $("#form :file"); //若只有單一表格要做動態樣式，則可以使用css選擇器
		$("#missing_img").change(function() {
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
					var img = $("<img width='250' height='200'>").attr('src', e.target.result);
						console.log(img);
						$("#preview").append(img).append("<br>").append("<br>");
					}
				}
			}
		}
		
	<!--推播-->
	    var MyPoint = "/missingCaseEchoServer";
	    var host = window.location.host;
	    var path = window.location.pathname;
	    var webCtx = path.substring(0, path.indexOf('/', 1));
	    var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;
	    
		var webSocket;
		
		function connect() {
			// 建立 websocket 物件
			webSocket = new WebSocket(endPointURL);
			
			webSocket.onopen = function(event) {
				
			};

			webSocket.onmessage = function(event) {

			};

			webSocket.onclose = function(event) {
				
			};
		}
		
		function sendMessage() {
			swal("新增成功！","","success");
		   
			var missing_url = "<%=request.getContextPath()%>/front-end/missingCase/listAllMissingCase.jsp";
			var missingName = $('#missingName').val().trim();
			var hiredate = $('#hiredate').val().trim();
			var missingDes = $('#missingDes').val().trim();
			var missing_type = $('#missing_type').val().trim();
			var loc = $('#loc').val().trim();
			var missing_img = $('#missing_img').val().trim();
			 var jsonObj = {"missing_url" : missing_url};
			 webSocket.send(JSON.stringify(jsonObj));
		}

		
		
		
		function disconnect () {
			webSocket.close();
		}
	

		$('#miracleBtn').click(function(){
			console.log('1111111111111111');
			$('#missingName').val('小龜龜');
			$('#missing_type').val('其他');
			
			
		});
	
	</script>

</body>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<%-- <script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script> --%>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>
<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
	width:  300px;   /* width:  300px; */
}
.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px;   /* height:  151px; */
}
</style>
<script>
$.datetimepicker.setLocale('zh');
$('#hiredate').datetimepicker({
       theme: '',              //theme: 'dark',
       timepicker:true,       //timepicker:true,
       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
       format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
	   value: '<%=missingDate%>', // value:   new Date(),

	});

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
					$('#address').val(results[0].formatted_address);
					$('#latitude').val(myMarker.getPosition().lat());
					$('#longitude').val(myMarker.getPosition().lng());
					infowindow.setContent(results[0].formatted_address);
					infowindow.open(map, myMarker);
				}
			}
		});
	    
	    google.maps.event.addListener(myMarker, 'dragend', function(evt){
// 	        document.getElementById('current').innerHTML = '<p>Marker dropped: Current Lat: ' + evt.latLng.lat().toFixed(3) + ' Current Lng: ' + evt.latLng.lng().toFixed(3) + '</p>';
	        console.log("!!!!!");
			geocoder.geocode({'latLng': myMarker.getPosition()}, function(results, status) {
				console.log("status=="+status);
				console.log("results=="+results);
	    		if (status == google.maps.GeocoderStatus.OK) {
	    			if (results[0]) {
	    				$('#loc').val(results[0].formatted_address);
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
// 	        document.getElementById('current').innerHTML = '<p>Currently dragging marker...</p>';
	    });
	    
	    map.setCenter(myMarker.position);
	    myMarker.setMap(map);
	    
	 
        
       
	

    service = new google.maps.places.PlacesService(map);

   
}



</script>


<script type="text/javascript">
  function initializeAutocomplete(){
    var input = document.getElementById('loc');
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
      console.log("lat==="+lat);
      console.log("lng==="+lng);
      var placeId = place.place_id;
      // to set city name, using the locality param
      var componentForm = {
        locality: 'short_name',
      };
      for (var i = 0; i < place.address_components.length; i++) {
        var addressType = place.address_components[i].types[0];
        if (componentForm[addressType]) {
          var val = place.address_components[i][componentForm[addressType]];
          document.getElementById("loc").value = val;
        }
      }
//       document.getElementById("#latitude").value = lat;
//       document.getElementById("#longitude").value = lng;
//       document.getElementById("#location_id").value = placeId;
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

      infowindow.setContent($("#loc").val());
	  infowindow.open(map, myMarker);
    });
      
      
      
      
      
  }
  $("ul.nav-menu li").attr('class', "" );
  $("#missing").attr('class', 'menu-active menu-has-children' )

  
</script>
</html>