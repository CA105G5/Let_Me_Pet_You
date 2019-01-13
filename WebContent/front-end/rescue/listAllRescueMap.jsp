<%@page import="java.util.List"%>
<%@page import="com.rescue.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	RescueService rescueSvc = new RescueService();
	List<RescueVO> allRescueList = rescueSvc.getAll();
	pageContext.setAttribute("allRescueList",allRescueList);

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>浪我陪你-救援地圖</title>


<script src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>

<style type="text/css">
p {
	font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
		monospace;
}

div {
	font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
		monospace;
}

</style>
<style type="text/css">

      	div#map {position: relative;overflow: hidden;width:1140px;height:550px;}
</style>

</head>
<body>



	<jsp:include page="/index_Header.jsp" flush="true" />
	
		<div class="container">
			<div class="row d-flex justify-content-center">
				<h1 style="margin-top: 0px">今日救援地圖</h1>
	    		<div id="map"></div>
    
    		</div>
    		<div style="display:none">
    		<form>
    		<c:forEach var="rescueVO" items="${allRescueList}">
    		<div class="rsc" style="display:none" id="${rescueVO.rsc_id}">
    		<input type="hidden" name="rsc_name" value="${rescueVO.rsc_name}">
    		<input type="hidden" name="rsc_lat" value="${rescueVO.rsc_lat}">
    		<input type="hidden" name="rsc_lon" value="${rescueVO.rsc_lon}">
    		<input type="hidden" name="rsc_sponsor" value="${rescueVO.rsc_sponsor}">
    		<input type="hidden" name="rsc_btime" value="${rescueVO.rsc_btime}">
    		<input type="hidden" name="rsc_sta" value="${rescueVO.rsc_sta}">
    		</div>
    		</c:forEach>
    		</form>
    		</div>
    	</div>

    
    <script type="text/javascript">
 
    var map, memMarker, mylat, mylng;
    var markers = [];
    var geolocation = 'https://www.googleapis.com/geolocation/v1/geolocate?key=AIzaSyCKTq4JnBzGP4UWtr5xe0c_wDQlWUbVrXU';
	var infoWindows;
	var center;
	var geocoder;
	var directionsService;
	var directionsDisplay;
    function initMap() {
        navigator.geolocation.getCurrentPosition(myFlow) 
    }
    
    function myFlow(a) {
            
    	center = {
                lat: a.coords.latitude,
                lng: a.coords.longitude
            };
            // 初始化地圖
            map = new google.maps.Map(document.getElementById('map'), {
                zoom: 12,
              center: { lat: a.coords.latitude, lng: a.coords.longitude }
//             center:{lat:24.967533,lng:121.191896}
            });
            var memIcon = {
            	    url: "<%=request.getContextPath()%>/images/memMaker.png", // url
            	    scaledSize: new google.maps.Size(50, 50), // scaled size
//             	    origin: new google.maps.Point(0,0), // origin
//             	    anchor: new google.maps.Point(0,0) // anchor
            	};
			//會員的位置
            memMarker = new google.maps.Marker({
             	position: { lat: a.coords.latitude,
                    lng: a.coords.longitude },
//                 position: { lat:24.967533,lng:121.191896},
                map: map,
                icon:memIcon,
                title:'目前位置',
                clickable:true,
                animation: google.maps.Animation.BOUNCE
            });

			 console.log("rsc(0)"+$(".rsc:eq(0)").attr('id'));
			 console.log("lat"+$(".rsc:eq(0) > input[name='rsc_lat']").val());
			 console.log("lng"+$(".rsc:eq(0) > input[name='rsc_lon']").val());
			 console.log("name"+$(".rsc:eq(0) > input[name='rsc_name']").val());
			 console.log("lat==="+parseFloat($(".rsc:eq(0) > input[name='rsc_lat']").val()));
      	  //建立地圖 marker 的集合
			for (var i = 0; i < $(".rsc").size() ; i++) {
				
				var rsc = "eq"+i;
				var idid = ".rsc:eq("+i+")";
				var rscid = $(idid).attr('id');
				var latlat = ".rsc:eq(" + i + ") > input[name='rsc_lat']";
				var lnglng = ".rsc:eq(" + i + ") > input[name='rsc_lon']";
				var srclat = $(latlat).val();
				var srclng = $(lnglng).val();
				var titletitle = ".rsc:eq(" + i + ") > input[name='rsc_name']";
				var stasta = ".rsc:eq(" + i + ") > input[name='rsc_sta']";
				var srcsta = $(stasta).val();
				console.log(srcsta);
				var srctitle = ($(titletitle).val())+"("+srcsta+")";
				var rscIcon={            	    
						url: "<%=request.getContextPath()%>/images/memMaker.png", // url
	            	    scaledSize: new google.maps.Size(50, 50), // scaled size
//	             	    origin: new google.maps.Point(0,0), // origin
//	             	    anchor: new google.maps.Point(0,0) // anchor
				}
				switch (srcsta) {
				  case "待救援":
				    rscIcon.url="<%=request.getContextPath()%>/images/memMaker.png";
				    break;
				  case "救援中":
					  rscIcon.url="<%=request.getContextPath()%>/images/memMaker.png";
				    break;
				  case "完成救援送審中":
					  rscIcon.url="<%=request.getContextPath()%>/images/memMaker.png";
				    break;
				  case "分派給志工":
					  rscIcon.url="<%=request.getContextPath()%>/images/memMaker.png";
				    break;
				  case "完成救援":
					  rscIcon.url="<%=request.getContextPath()%>/images/memMaker.png";
				    break;
				  case "志工已完成":
					  rscIcon.url="<%=request.getContextPath()%>/images/memMaker.png";
				    break;
				 
				}

				var marker= new google.maps.Marker({
	    		position: {lat:parseFloat(srclat),lng:parseFloat(srclng)},
	    		map: map,
	    		title: srctitle,
	    		icon:rscIcon
	  		});
				
				var content = "<div style='display: flex;flex-direction:column'>"
				+"<h4>"+srctitle+"</h4>"+"<div class='justify-content-between'>"
				+"<a href="
				+"<%=request.getContextPath()%>/"
				+"front-end/rescue/rescue.do?action=getOne_For_Display&rsc_id="
				+rscid
				+">"
				+"<img class='img-fluid' style='width:100px;height:100px;display:block; margin:auto'src="
				+"<%=request.getContextPath()%>/"
				+"back-end/rescue/rescueImg.do?rsc_id="
			    +rscid
				+" alt='' title='點擊查看詳情'>"
				+"</div></a>"
				+"<div style='text-align:center'>"
				+"狀態:"
				+srcsta
				+"</div>"
				+"<input type='button' onClick=getDir("+parseFloat(srclat) +","+ parseFloat(srclng)+") value='Go!'>"
				+"</div>";
				
				attachSecretMessage(marker,content) ;
			
			}
			function attachSecretMessage(marker, content) {
				var infowindow = new google.maps.InfoWindow({
					content: content ,
					size: new google.maps.Size(200, 200)
				});
				google.maps.event.addListener(marker, 'click', function() {
					infowindow.open(marker.get('map'), marker);
				});
			}

		    
		    
			geocoder = new google.maps.Geocoder();
		    directionsService = new google.maps.DirectionsService();
		    directionsDisplay = new google.maps.DirectionsRenderer({
		        suppressMarkers: false
		    });
		    directionsDisplay.setMap(map);
		    directionsDisplay.setPanel(document.getElementById("directionsPanel"));
      	  
        }
        
    function getDir(lat,lng) {
//      geocoder.geocode({
//          'address': center
//      },

//      function (results, status) {
//          if (status == google.maps.GeocoderStatus.OK) {
//              var origin = results[0].geometry.location;
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
             
//              directionsService.route(request, function (response, status) {
//                  if (status == google.maps.DirectionsStatus.OK) {
//                      directionsDisplay.setDirections(response);
//                  }
//              });

//          } else {
//              document.getElementById('clientAddress').value =
//              "Directions cannot be computed at this time.";
//          }
//      });
 }



    </script>

<script async defer
   src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCKTq4JnBzGP4UWtr5xe0c_wDQlWUbVrXU&callback=initMap">
</script>

</body>
</html>