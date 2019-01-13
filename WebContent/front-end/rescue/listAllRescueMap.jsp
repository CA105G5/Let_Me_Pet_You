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

    function initMap() {
        navigator.geolocation.getCurrentPosition((position) => {
            console.log(position.coords);
            mylat = position.coords.latitude;
            mylng = position.coords.longitude;
            // 初始化地圖
            map = new google.maps.Map(document.getElementById('map'), {
                zoom: 12,
              center: { lat: mylat, lng: mylng }
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
             	position: { lat: mylat, lng: mylng },
//                 position: { lat:24.967533,lng:121.191896},
                map: map,
                icon:memIcon,
                title:'目前位置',
                animation: google.maps.Animation.BOUNCE
            });
//             var results=$(".rsc").size();
			 console.log("rsc(0)"+$(".rsc:eq(0)").attr('id'));
			 console.log("lat"+$(".rsc:eq(0) > input[name='rsc_lat']").val());
			 console.log("lng"+$(".rsc:eq(0) > input[name='rsc_lon']").val());
			 console.log("name"+$(".rsc:eq(0) > input[name='rsc_name']").val());
			 console.log("lat==="+parseFloat($(".rsc:eq(0) > input[name='rsc_lat']").val()));
      	  //建立地圖 marker 的集合
			for (var i = 0; i < $(".rsc").size() ; i++) {
				
				var rsc = "eq"+i;
				var latlat = ".rsc:eq(" + i + ") > input[name='rsc_lat']";
				var lnglng = ".rsc:eq(" + i + ") > input[name='rsc_lon']";
				console.log("rsc====="+rsc);
				console.log("rsclat====="+latlat);
				console.log("rsclng====="+lnglng);
				var srclat = $(latlat).val();
				var srclng = $(lnglng).val();
				console.log("srclat=="+srclat);
				console.log("srclng=="+srclng);
			var marker = new google.maps.Marker({
	    		position: {lat:parseFloat(srclat),lng:parseFloat(srclng)},
	    		map: map,
	    		title: ''
	  		});
			}
    	  
        });
    }


    </script>

<script async defer
   src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCKTq4JnBzGP4UWtr5xe0c_wDQlWUbVrXU&callback=initMap">
</script>

</body>
</html>