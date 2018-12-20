<%@page import="com.missingCase.model.*"%>
<%@ page language="java" contentType="text/html; charset=BIG5" pageEncoding="BIG5"%>

<% missingCaseVO missingCaseVO = (missingCaseVO) request.getAttribute("missingCaseVO");%>
<html>
<head>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
		<title>Horse Club</title>

		<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
			<!--
			CSS
			============================================= -->
			<link rel="stylesheet" href="css/linearicons.css">
			<link rel="stylesheet" href="css/font-awesome.min.css">
			<link rel="stylesheet" href="css/bootstrap.css">
			<link rel="stylesheet" href="css/magnific-popup.css">
			<link rel="stylesheet" href="css/nice-select.css">					
			<link rel="stylesheet" href="css/animate.min.css">
			<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">	
			<link rel="stylesheet" href="css/owl.carousel.css">
			<link rel="stylesheet" href="css/main.css">

</head>
<body>

<jsp:include page="/front-end/missingCase/missing_case_header.jsp" flush="true" />

			<!-- End banner Area -->	
			<section class="upcoming-event-area section-gap">
					<div class="container">
						<div class="row d-flex justify-content-center">
							<div class="col-md-9 pb-40 header-text text-center">
								<h1 class="pb-10">Checkout Your Pet</h1>
								<p>
									Who are in extremely love with eco friendly system.
								</p>
							</div>
						</div>
			<div class="col-xs-12 col-sm-3">
				<div class="list-group">
					<a href="listAllMissingCase.jsp" class="list-group-item ">失蹤案例總覽</a>
					<a href="addMissing.jsp" class="list-group-item ">失蹤案例新增</a>
				</div>
			</div>							
		<div class="row align-items-center upcoming-wrap">
							<div class="col-lg-6 upcoming-left">
								<img class="img-fluid" src="<%=request.getContextPath() %>/missingcase/missingcase.do?missingcaseno=${missingCaseVO.missing_case_id}" alt="">
							</div>
							<div class="col-lg-6 upcoming-right">
								<p class="meta">
									<span>${missingCaseVO.missing_name}</span>
									${missingCaseVO.missing_date}
								</p>
								<p>
									${missingCaseVO.missing_des}
								</p>
								<a class="primary-btn text-uppercase" href="#">查看詳情</a>
							</div>
						</div>
					</div>
				</section>

<%-- <table>
	<tr>
		<th>案例編號</th>
		<th>會員編號</th>
		<th>失蹤日期</th>
		<th>失蹤內容描述</th>
		<th>失蹤動物名稱</th>
		<th>失蹤地點</th>
		<th>失蹤案例上架狀態</th>
	</tr>
	<tr>
			<td>${missingCaseVO.missing_case_id}</td>
			<td>${missingCaseVO.memb_id}</td>
			<td>${missingCaseVO.missing_date}</td>
			<td>${missingCaseVO.missing_des}</td>
			<td>${missingCaseVO.missing_name}</td>
			<td>${missingCaseVO.missing_loc}</td> 
			<td><img src="<%=request.getContextPath() %>/missingcase/missingcase.do?missingcaseno=${missingCaseVO.missing_case_id }"></td>
	</tr>
</table>

--%>




<script src="js/vendor/jquery-2.2.4.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script src="js/vendor/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
	<script src="js/easing.min.js"></script>
	<script src="js/hoverIntent.js"></script>
	<script src="js/superfish.min.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.sticky.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/parallax.min.js"></script>
	<script src="js/waypoints.min.js"></script>
	<script src="js/jquery.counterup.min.js"></script>
	<script src="js/mail-script.js"></script>
	<script src="js/main.js"></script>







</body>
</html>