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
/*       	html, body { height: 100% } */
/*       	#map { height: 55%; width:55%} */
      	div#map {position: relative;overflow: hidden;width:1140px;height:600px;}
</style>

</head>
<body>



	<jsp:include page="/index_Header.jsp" flush="true" />
	
		<div class="container">
			<div class="row d-flex justify-content-center">
				<h1 style="margin-top: 0px">今日救援地圖</h1>
	    		<div id="map"></div>
    
    		</div>
    	</div>
    
    
    <script type="text/javascript">
 
    var map, memMarker, mylat, mylng;
    var markers = [];
    var geolocation = 'https://www.googleapis.com/geolocation/v1/geolocate?key=AIzaSyCKTq4JnBzGP4UWtr5xe0c_wDQlWUbVrXU';

    function initMap() {
        navigator.geolocation.getCurrentPosition((position) => {
            console.log(position.coords);
            mylat = position.coords.latitude;
            mylng = position.coords.longitude;
            // 初始化地圖
            map = new google.maps.Map(document.getElementById('map'), {
                zoom: 12,
                center: { lat: mylat, lng: mylng }
            });
            var memIcon = {
            	    url: "<%=request.getContextPath()%>/images/memMaker.png", // url
            	    scaledSize: new google.maps.Size(50, 50), // scaled size
            	    origin: new google.maps.Point(0,0), // origin
            	    anchor: new google.maps.Point(0,0) // anchor
            	};
			//會員的位置
            memMarker = new google.maps.Marker({
                position: { lat: mylat, lng: mylng },
                map: map,
                icon:memIcon,
                title:'目前位置',
                animation: google.maps.Animation.BOUNCE
            });
			
      	  //建立地圖 marker 的集合
      	  //var marker_config = [{
      		//position: {lat: 25.04, lng: 121.512},
      		//map: map
      		//title:'總統府'
      	  //},{
      		//position: {lat: 25.035, lng: 121.519},
      		//map: map
      		//title:'中正紀念堂'
      	  //},{
      		//position:{lat: 23.973875, lng: 120.982025},
      		//map:map
      	  //}];

      	  //標出 marker
      	  //marker_config.forEach(function(e,i){
      		//markers[i] = new google.maps.Marker(e);
      		//markers[i].setMap(map);
      	  //});
        });
    }


    </script>

<script async defer
   src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCKTq4JnBzGP4UWtr5xe0c_wDQlWUbVrXU&callback=initMap">
</script>

</body>
</html>