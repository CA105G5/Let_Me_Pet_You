<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>TEST</title>
<meta charset="utf-8">



<!-- START template link -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="https://fonts.googleapis.com/css?family=Muli:300,400,600,700" rel="stylesheet">

<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">

<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">

<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/ionicons.min.css">

<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/jquery.timepicker.css">

<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">
<!-- END template link -->

<!-- START mine -->
<!-- <link rel="stylesheet" href="g2/css/index.css"> -->
<!-- END mine -->
<style type="text/css">
.iTravel{
	font-size:44px;
}
.ftco-navbar-light .navbar-nav > .nav-item > .nav-link{
	font-size:18px;
}
video{
	height:120%;
	width:120%;
	margin-left:-10%;
	margin-top: -20px;
}
body {
	font-family: \5FAE\8EDF\6B63\9ED1\9AD4, \65B0\7D30\660E\9AD4;
}
.us{
	border-radius:50%;
}
</style>

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand iTravel" href="<%=request.getContextPath()%>/front-end/index.jsp">iTravel</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu</button>

				<div class="collapse navbar-collapse" id="ftco-nav">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Schedule</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="<%=request.getContextPath()%>/front-end/sche/schedule.jsp">Schedule</a> 
								<a class="dropdown-item" href="<%=request.getContextPath()%>/front-end/spot/spot.jsp">Attractions</a> 
							</div></li>

							<li class="nav-item"><a href="<%=request.getContextPath()%>/front-end/group/GroupHome.jsp" class="nav-link">Travel Buddy</a></li>
							<li class="nav-item"><a href="<%=request.getContextPath()%>/front-end/stream/select_page.jsp" class="nav-link">Live</a></li>
							<li class="nav-item"><a href="<%=request.getContextPath()%>/front-end/post/listAllPost.jsp" class="nav-link">Blog</a></li>
							<li class="nav-item"><a href="<%=request.getContextPath()%>/front-end/ticket/listAllTicket.jsp" class="nav-link">Tickets</a></li>
							<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
								<c:if test="${empty account}">
								Member 
							</c:if>
							<c:if test="${!empty account}">
							${account.memName}
						</c:if>
					</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<c:if test="${!empty account}">
						<%-- 							<a class="dropdown-item" href="<%=request.getContextPath()%>/mem/mem.do?memId=${account.memId}" action="getOne_For_Display">My Page</a> --%>
						<%-- 							<a class="dropdown-item" href="<%=request.getContextPath()%>/front-end/mem/memberinfo.jsp?memId=${memVO_login.memId}">My Page</a>  --%>
						<%-- 							<a class="dropdown-item" href="<%=request.getContextPath()%>/mem/mem.do?memId=${memVO_login.memId}">My Page</a>  --%>
						<form id="my_page" method="post" action="<%=request.getContextPath()%>/mem/mem.do">
							<a class="dropdown-item" href="javascript:{}" onclick="document.getElementById('my_page').submit();">My Page</a>
							<input type="hidden" name="memId" value="${memVO_login.memId}">	
							<input type="hidden" name="action" value="getOne_For_Display">	
						</form>
						<a class="dropdown-item" href="<%=request.getContextPath()%>/front-end/sche/mySchedule.jsp">My Schedule</a> 
						<a class="dropdown-item" href="<%=request.getContextPath()%>/front-end/group/ManageListGroup.jsp">My Group</a> 
						<a class="dropdown-item" href="<%=request.getContextPath()%>/front-end/ord/listMyOrder.jsp">My Order</a>
						<a class="dropdown-item" href="<%=request.getContextPath()%>/front-end/post/listAllMem.jsp">My Post</a>
						<a class="dropdown-item" href="<%=request.getContextPath()%>/mem/mem.do?action=logout" id="SignOut">Log Out</a>
						<%-- 							<form METHOD="post" ACTION="<%=request.getContextPath()%>/mem/mem.do" id="OutSubmit"> --%>
							<!-- 							<input type="hidden" name="action" value="logout"> -->
						</form>	
					</c:if>
					<c:if test="${empty account}">
					<a class="dropdown-item" href="<%=request.getContextPath()%>/front-end/mem/login.jsp">Log In</a>
				</c:if>
			</div></li>
		</ul>
	</div>
</div>
</nav>
   <div class="video-container">
      <video autoplay loop muted id="video-bg">
        <source src="g2/img/travelvideo.mp4" type="video/mp4">
        </video>
    </div>
    <div class="divforvideo">


















<link href="https://cdnjs.cloudflare.com/ajax/libs/alertify.js/0.3.11/alertify.core.min.css" rel="stylesheet" /> 
<link href="https://cdnjs.cloudflare.com/ajax/libs/alertify.js/0.3.11/alertify.default.min.css" rel="stylesheet" /> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/alertify.js/0.3.11/alertify.min.js"></script>	


	<!-- START loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>
	
<!-- ALERTIFY.js v0.3.11 -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/alertify.js/0.3.11/alertify.core.min.css" rel="stylesheet" />
  <link href="https://cdnjs.cloudflare.com/ajax/libs/alertify.js/0.3.11/alertify.default.min.css" rel="stylesheet" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/alertify.js/0.3.11/alertify.min.js"></script>	
  <script src="js/ad.js"></script>	
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-migrate-3.0.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/jquery.timepicker.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>
</body>
</html>