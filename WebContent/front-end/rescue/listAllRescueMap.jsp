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
<title>救援地圖</title>


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
      	div#map {position: relative;overflow: hidden;width:800px;height:600px;}
</style>

</head>
<body>



	<jsp:include page="/index_Header.jsp" flush="true" />
	
		<div class="container">
			<div class="row d-flex justify-content-center">

<!-- 				<div> -->
<!-- 				  <input id="address" type="textbox" /> -->
<!-- 				  <input type="button" value="查詢" onclick="codeAddress()"/> -->
<!-- 				</div>		 -->
	    		<div id="mymap"></div>
    
    		</div>
    	</div>
    
    
    <script type="text/javascript">

    var mymap;
	var markers = [];
	//台灣經、緯度
    var myLatLng = {lat: 23.973875, lng: 120.982024};
	var geocoder;
    function initMap() {
	  geocoder = new google.maps.Geocoder();
      mymap = new google.maps.Map(document.getElementById('mymap'), {
	  //lat:緯度、lng:經度、zoom:數字越大放越大
        center: myLatLng,
        zoom: 7.8
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
	}  
	function codeAddress() {
		geocoder = new google.maps.Geocoder();
		var address = document.getElementById('address').value;
		geocoder.geocode( { 'address': address}, function(results, status) {
			if (status == 'OK') {
				LatLng = results[0].geometry.location;
				console.log(results[0].geometry.location.lat());
				console.log(results[0].geometry.location.lng());
				// map.setCenter(results[0].geometry.location);
				// var marker = new google.maps.Marker({
				// 	map: map,
				// 	position: results[0].geometry.location,
				// 	title:"緯度："+results[0].geometry.location.lat()+" , 經度："+results[0].geometry.location.lng()
				// });
			} else {
				alert('Geocode was not successful for the following reason: ' + status);
			}
		});
	}


    </script>

<script async defer
   src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCKTq4JnBzGP4UWtr5xe0c_wDQlWUbVrXU&callback=initMap">
</script>

</body>
</html>